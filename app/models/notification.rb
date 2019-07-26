class Notification < ApplicationRecord
  has_paper_trail skip: [:updated_at, :created_at]

  has_many :notifications_users, dependent: :destroy
  has_many :users, through: :notifications_users

  validates :text, presence: true

  scope :current, -> {where("expires_at > ? or expires_at is null", DateTime.now).order("id desc")}

  # after_create :assign_to_all_users
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
end
