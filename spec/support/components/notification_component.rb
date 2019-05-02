class NotificationComponent < BaseComponent
  def wait
    page.find ".got-notification", visible: false
  end

  def title
    find("input[formcontrolname='title']").value
  end
  def title=(value)
    fill_in 'Title', with: value
  end

  def text
    find("input[formcontrolname='text']").value
  end
  def text=(value)
    fill_in 'Notification text', with: value
  end

  def expires_at=(value)
    set_datepicker("Expires at", value)
  end
end
