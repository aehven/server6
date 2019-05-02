module Helpers
  def in_app_notification
    sleep 0.5
    find("snack-bar-container").text
  end
end
