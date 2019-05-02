class NotificationsUser < ApplicationRecord
  belongs_to :notification
  belongs_to :user

  scope :current, -> {joins(:notification).where("notifications.expires_at > '#{DateTime.now.utc}' or notifications.expires_at is null").order("id desc")}
  scope :acknowledged, -> {where("acknowledged_at is not null")}
  scope :unacknowledged, -> {where("acknowledged_at is null")}
  scope :email, -> {joins(:notification).where("notifications.email = 1")}
  scope :in_app, -> {joins(:notification).where("notifications.in_app = 1")}
  scope :sms, -> {joins(:notification).where("notifications.sms = 1")}
end
