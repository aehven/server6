require "rails_helper"

xfeature "Supervisor permissions on organizations: " do
  let(:login_component) { LoginComponent.new }
  let(:menu) { MenuComponent.new }
  let(:home) { HomeComponent.new }
  let(:organization_list) { OrganizationListComponent.new(find("app-organization-list")) }
  let(:organization) { OrganizationComponent.new }

  scenario "can index organization and descendants" do
    skip "No organizations in this app" if ENV['USERS_BELONG_TO_ORGANIZATIONS'] != "true"

    user = User.supervisor.first
    login_component.sign_in user

    home.wait
    menu.organizations
    organization_list.wait

    expect(organization_list.item_count).to eq 2
    expect(page).to have_text "The Three Broomsticks"
    expect(page).to have_text "The Brewery"
  end

  scenario "can read and update organization and descendants" do
    skip "No organizations in this app" if ENV['USERS_BELONG_TO_ORGANIZATIONS'] != "true"

    user = User.supervisor.first
    login_component.sign_in user

    home.wait
    menu.organizations
    organization_list.wait

    (0..1).each_with_index do |i|
      organization_list.item(i).click
      organization.edit
      original_name = organization.name
      organization.name = organization.name + " edited"
      organization.submit

      organization_list.wait
      expect(organization_list.item(i)).to have_text "#{original_name} edited"
    end
  end

  scenario "can destroy descendant organizations only" do
    skip "No organizations in this app" if ENV['USERS_BELONG_TO_ORGANIZATIONS'] != "true"

    user = User.supervisor.first
    login_component.sign_in user

    home.wait
    menu.organizations
    organization_list.wait

    # deleting the first organization will not work because it contains us
    organization_list.item(0).click

    organization.delete(false)
    organization.delete(true)

    organization_list.wait
    expect(organization_list.item_count).to eq 2

    # deleting our suborganization will work
    organization_list.item(1).click
    organization_name = organization.name

    organization.delete(false)
    organization.delete(true)

    organization_list.wait
    expect(organization_list.item_count).to eq 1
    expect(page).not_to have_text organization_name
  end

  scenario "can create suborganizations" do
    skip "No organizations in this app" if ENV['USERS_BELONG_TO_ORGANIZATIONS'] != "true"

    user = User.supervisor.first
    login_component.sign_in user

    home.wait
    menu.organizations
    organization_list.wait
    organization_list.new_item("Organization")

    organization.name = "Rspec organization"
    organization.address1 = "1234 Penny Lane"
    organization.address2 = "Suite sweet"
    organization.submit

    organization_list.wait
    expect(page).to have_text "Rspec organization"

    expect(Organization.last.parent).to eq user.organization
  end

  scenario "try to get disallowed stuff" do
    skip "No organizations in this app" if ENV['USERS_BELONG_TO_ORGANIZATIONS'] != "true"

    user = User.supervisor.first
    login_component.sign_in user
    home.wait

    visit "/#/organization/3"
    sleep 0.5
    expect(page.current_url.include? "permission-denied").to be true
  end
end
