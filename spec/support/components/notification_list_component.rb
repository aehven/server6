class NotificationListComponent < ListComponent
  def wait
    page.find ".got-notification-list", visible: false
  end
end
