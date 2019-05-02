require "rails_helper"

feature "Create notification: " do
  let(:login_component) { LoginComponent.new }
  let(:menu) { MenuComponent.new }
  let(:dashboard) { DashboardComponent.new }
  let(:notification) { NotificationComponent.new }
  let(:notification_list) { NotificationListComponent.new(find("app-notification-list")) }
  let(:current_user) { User.first }
  
  before(:each) do
    clear_mailbox
  end

  scenario "create notification for email only" do
    login_component.sign_in current_user
    dashboard.wait

    menu.notifications
    notification_list.wait
    notification_list.new_item "Notification"
    notification.wait

    notification.title = "email only title"
    notification.text = "email only text"
    notification.checkbox("Email").click
    notification.radio("Info").click
    notification.expires_at = 28

    notification.submit

    verify_email_receipt(to: current_user.email,
      from: "aehven@binarytrees.biz",
      subject: "email only title",
      body: "email only text",
      place: User.count) #email to the first user should be in the User.count position down because it went out first
  end

  scenario "create notification for in-app only" do
    login_component.sign_in current_user
    dashboard.wait

    menu.notifications
    notification_list.wait
    notification_list.new_item "Notification"
    notification.wait

    notification.title = "in-app only title"
    notification.text = "in-app only text"
    notification.checkbox("In-app").click
    notification.radio("Info").click
    notification.expires_at = 28

    notification.submit

    verify_no_email

    expect(in_app_notification).to eq "in-app only text\nOK"
  end

  scenario "create notification for email and in-app" do
    login_component.sign_in current_user
    dashboard.wait

    menu.notifications
    notification_list.wait
    notification_list.new_item "Notification"
    notification.wait

    notification.title = "both title"
    notification.text = "both text"
    notification.checkbox("Email").click
    notification.checkbox("In-app").click
    notification.radio("Info").click
    notification.expires_at = 28

    notification.submit

    verify_email_receipt(to: current_user.email,
      from: "aehven@binarytrees.biz",
      subject: "both title",
      body: "both text",
      place: User.count) #email to the first user should be in the User.count position down because it went out first

    expect(in_app_notification).to eq "both text\nOK"
  end
end
