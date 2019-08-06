class NotificationsUser < ApplicationRecord
  belongs_to :notification
  belongs_to :user
end
