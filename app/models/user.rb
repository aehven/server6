class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User

  has_paper_trail ignore: [
      :sign_in_count,
      :current_sign_in_at,
      :last_sign_in_at,
      :current_sign_in_ip,
      :last_sign_in_ip
    ],
    skip: [:tokens, :updated_at, :created_at, :websocket_token]

  enum role: {
    regular: 100,
    manager: 200,
    supervisor: 300,
    admin: 1000
  }

  before_create :generate_unsubscribe_token
  before_create :generate_websocket_token
  after_create :send_welcome_email

  has_many :notifications_users, dependent: :destroy
  has_many :notifications, through: :notifications_users

  belongs_to :customer, optional: true

  delegate :signs, to: :customer, allow_nil: true

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

  def token_validation_response
    UserSerializer.new(self) #is this method necessary since we're not adding params here anymore?  (adding them in the serializer now)
  end

  def self.env_vars_to_client
    ENV.select{|k, v| k.start_with? "BTSTC_"}
  end

  def valid_password?(password)
    # generate_websocket_token

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

  def generate_websocket_token
    self.websocket_token = SecureRandom.hex(30)
  end

  def has_notification?
    !notifications_users.regular.current.unacknowledged.empty?
  end

  def next_notification
    notifications_users.current.in_app.unacknowledged.first&.notification
  end

  def acknowledge_notification(id)
    notifications_users.where(notification_id: id).first.update_attribute(:acknowledged_at, DateTime.now)
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

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.current
    Thread.current[:user]
  end

  def self.current=(user)
    Thread.current[:user] = user
  end

  def can_access_customer?(cid)
    (self.customer_id == cid) || (self.can?(:access, :sub_customers) && (self.customer.self_and_descendants.map(&:id).include? cid))
  end

  def after_sign_in_callback
    Rails.logger.debug "USER SIGNED IN: #{self.email}"
  end
end
