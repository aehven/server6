class Notification < ApplicationRecord
  has_paper_trail skip: [:updated_at, :created_at]

  has_many :notifications_users, dependent: :destroy
  has_many :users, through: :notifications_users

  validates :text, presence: true

  scope :email, -> {where("notifications.email = 1")}
  scope :in_app, -> {where("notifications.in_app = 1")}
  scope :sms, -> {where("notifications.sms = 1")}

  scope :current, -> {where("expires_at > ? or expires_at is null", DateTime.now).order("id desc")}
  scope :acknowledgeable, -> {where(duration: nil)}
  scope :acknowledged, -> {acknowledgeable.includes(:notifications_users).preload(:notifications_users).where("notifications_users.acknowledged_at is not null")}
  scope :unacknowledged, -> {acknowledgeable.includes(:notifications_users).preload(:notifications_users).where("notifications_users.acknowledged_at is null")}

  # after_create :assign_to_all_users
  # after_create :send_in_app, if: :in_app
  after_create :broadcast_in_app, if: :in_app
  after_create :send_email, if: :email

  enum level: [:Info, :Warning, :Error]

  def assign_to_all_users
    sql = "insert into `notifications_users`(`user_id`, `notification_id`) values "

    User.all.each do |user|
      sql << "(#{user.id}, #{self.id}),"
    end

    sql.chomp!(",")

    ActiveRecord::Base.connection.execute sql
  end

  def send_email
    begin
      EmailNotificationJob.perform_later(self)
    rescue => e
      Rails.logger.error("#{e.backtrace.join('\n')}")
    end
  end

  def send_in_app
    if(users.count > 0)
      ActionCableNotificationJob.perform_later(user_ids: [user_ids], notification_id: self.id)
    end
  end

  def broadcast_in_app
    # ActionCableNotificationJob.perform_later(user_ids: "all", notification_id: self.id)
    NotificationChannel.broadcast_to "notifications_for_", self
  end
end
