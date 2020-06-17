require "rails_helper"

feature "Regular permissions on organizations: " do
  let(:login_component) { LoginComponent.new }
  let(:menu) { MenuComponent.new }
  let(:home) { HomeComponent.new }
  let(:organization_list) { OrganizationListComponent.new(find("app-organization-list")) }
  let(:organization) { OrganizationComponent.new }

  scenario "no organizations menu" do
    user = User.regular.first
    login_component.sign_in user

    home.wait
    expect(menu.has?("Organizations")).to be_falsy
  end

  scenario "try to get disallowed stuff" do
    skip "No organizations in this app" if ENV['USERS_BELONG_TO_ORGANIZATIONS'] != "true"

    user = User.regular.first
    login_component.sign_in user
    home.wait

    visit "/#/organizations"
    sleep 0.5
    home.wait

    visit "/#/organization/1"
    sleep 0.5
    home.wait

    visit "/#/organization/2"
    sleep 0.5
    home.wait

    visit "/#/organization/3"
    sleep 0.5
    home.wait
  end
end
