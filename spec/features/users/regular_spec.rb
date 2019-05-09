require "rails_helper"

feature "Regular permissions on users: " do
  let(:login_component) { LoginComponent.new }
  let(:menu) { MenuComponent.new }
  let(:home) { HomeComponent.new }
  let(:user_list) { UserListComponent.new(find("app-user-list")) }
  let(:user) { UserComponent.new }

  scenario "no customers menu" do
    user = User.regular.first
    login_component.sign_in user

    home.wait
    expect(menu.has?("Users")).to be_falsy
  end

  scenario "try to get disallowed stuff" do
    user = User.regular.first
    login_component.sign_in user
    home.wait

    visit "/#/user/5"
    sleep 0.5
    home.wait
  end
end
