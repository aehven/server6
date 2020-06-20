class User < ApplicationRecord
  has_secure_password

  has_paper_trail ignore: [
      :sign_in_count,
      :current_sign_in_at,
      :last_sign_in_at,
      :current_sign_in_ip,
      :last_sign_in_ip
    ],
    skip: [:updated_at, :created_at]

  enum role: {
    regular: 100,
    manager: 200,
    supervisor: 300,
    admin: 1000
  }

  before_create :generate_unsubscribe_token
  after_create :send_welcome_email

  has_many :organizations_users, dependent: :destroy
  has_many :organizations, through: :organizations_users

  has_many :notifications_users, dependent: :destroy
  has_many :notifications, through: :notifications_users

  belongs_to :organization, optional: true

  delegate :signs, to: :organization, allow_nil: true

  def self.search(search)
    columns = %w{
      first_name
      last_name
      email
    }

    conditions = []
    search.split(" ").each do |term|
      conditions << columns.map{|p| "#{p} like '%#{term}%'"}.join(' OR ')
    end

    User.where(conditions.join(' OR '))
  end

  def ability
    @ability ||= Ability.new(self)
  end
  delegate :can?, :cannot?, :to => :ability

  def permissions
    ability.permissions
  end

  def valid_password?(password)
    if Rails.env == "development" && ENV['IGNORE_PASSWORDS']
      return true
    end

    #####
    # To log in as another user, put the intended user's email
    # in the login email field, as usual.  But instead of that
    # user's password, enter your own email and password in
    # the password field, space-separated.  If you have the
    # ability to spoof and the intende user is spoofable,
    # you're in.
    #####
    p1, p2 = password.split(" ")
    if p2
      user = User.where(email: p1).first
      if user&.ability&.can?(:spoof, self) && user.valid_password?(p2)
        logger.warn("spoofing!")

        return true
      else
        logger.warn("spoofing denied to #{user}")
      end
    end

    super
  end

  def send_welcome_email
    # GenericMailer.welcome(self).deliver_later
  end

  def generate_unsubscribe_token
    self.unsubscribe_token = SecureRandom.hex(30)
  end

  # def has_notification?
  #   !notifications_users.regular.current.unacknowledged.empty?
  # end

  def next_notification
    notifications.current.in_app.unacknowledged.first
  end

  def acknowledge_notification(id)
    notifications_users.where(notification_id: id).first&.update_attribute(:acknowledged_at, DateTime.now)

    notification_id = next_notification&.id

    if(notification_id)
      ActionCableNotificationJob.set(wait: 5).perform_later(user_ids: [self.id], notification_id: notification_id)
    end
  end

  def unsubscribed?
    if(!unsubscribed_at.nil?)
      return true
    else
      if(unsubscribe_token.nil?)
        update_attributes(unsubscribe_token: SecureRandom.hex(30))
      end
      return false
    end
  end

  def to_s
    "#{first_name} #{last_name} (#{email})"
  end

  def organization
    organizations.order(:kind).first
  end

  def organization_forest
    #####
    # all the orgs in this user's trees; note that a user can have multiple trees, 
    # i.e. belong to multiple high-level organizations that have lower-level ones beneath them,
    # so the orgs are really a forest, hence all the mapping and squishing below.
    #
    # just getting self.organizations is NOT the same because that is a list of orgs the
    # user directly belongs to by organizations_users entries, and doesn't include organization
    # descendants.
    #####
    self.organizations.map(&:self_and_descendants).flatten.uniq
  end

  def can_access_organization?(oid)
    oid.nil? ||
    (self.can?(:access, :sub_organizations) && (organization.forets.map(&:id).include? oid))
  end

  def organization_name
    organization&.name || "Binary Trees"
  end

  def organization_name_with_ancestors
    organization&.name_with_ancestors || "Binary Trees"
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.current
    Thread.current[:user]
  end

  def self.current=(user)
    Thread.current[:user] = user
  end


  def after_sign_in_callback
    # if there's a pending notification, send it.  If there are more than one, the next one will be
    # queued up after the first is acknowledged (see user#acknowledge_notification)

    notification = next_notification
    if(notification)
      ActionCableNotificationJob.set(wait: 10).perform_later(user_ids: [id], notification_id: notification.id)
    end
  end
end
