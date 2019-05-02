require "rails_helper"

feature "Regular permissions on users: " do
  let(:login_component) { LoginComponent.new }
  let(:menu) { MenuComponent.new }
  let(:dashboard) { DashboardComponent.new }
  let(:user_list) { UserListComponent.new(find("app-user-list")) }
  let(:user) { UserComponent.new }

  scenario "no customers menu" do
    user = User.regular.first
    login_component.sign_in user

    dashboard.wait
    expect(menu.has?("Users")).to be_falsy
  end

  scenario "try to get disallowed stuff" do
    user = User.regular.first
    login_component.sign_in user
    dashboard.wait

    visit "/#/user/5"
    sleep 0.5
    # Permission denied redirects to login page, and that
    # redirects to dashboard because we're already logged in.
    expect(page.current_url.include? "dashboard").to be true
  end
end
