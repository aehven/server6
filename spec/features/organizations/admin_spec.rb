require "rails_helper"

feature "Admin permissions on organizations: " do
  let(:login_component) { LoginComponent.new }
  let(:menu) { MenuComponent.new }
  let(:home) { HomeComponent.new }
  let(:organization_list) { OrganizationListComponent.new(find("app-organization-list")) }
  let(:organization) { OrganizationComponent.new }

  scenario "can index all organizations" do
    skip "No organizations in this app" if ENV['USERS_BELONG_TO_ORGANIZATIONS'] != "true"

    user = User.admin.first
    login_component.sign_in user

    home.wait
    menu.organizations
    organization_list.wait

    expect(organization_list.item_count).to eq 4
  end

  scenario "can read and update all organizations" do
    skip "No organizations in this app" if ENV['USERS_BELONG_TO_ORGANIZATIONS'] != "true"

    user = User.admin.first
    login_component.sign_in user

    home.wait
    menu.organizations
    organization_list.wait

    (0..2).each_with_index do |i|
      organization_list.item(i).click
      organization.edit
      original_name = organization.name
      organization.name = organization.name + " edited"
      organization.submit

      organization_list.wait
      expect(organization_list.item(i)).to have_text "#{original_name} edited"
    end
  end

  scenario "can destroy all organizations" do
    skip "No organizations in this app" if ENV['USERS_BELONG_TO_ORGANIZATIONS'] != "true"

    user = User.admin.first
    login_component.sign_in user

    initial_organization_count = Organization.count

    home.wait
    menu.organizations
    organization_list.wait

    organization_list.item(0).click
    organization.wait
    organization_name = organization.name

    organization.delete(false)
    organization.delete(true)

    organization_list.wait

    # deleting the first organization also deletes its sub-organization,
    # so expect -2
    # -1 without nested organizations

    expect(organization_list.item_count).to eq initial_organization_count-1
    expect(page).not_to have_text organization_name

    expect(Organization.count).to eq initial_organization_count-1

    initial_organization_count = Organization.count

    # deleting a organization without subs, expect -1 afterwards

    organization_list.item(0).click
    organization.wait
    organization_name = organization.name

    organization.delete(false)
    organization.delete(true)

    organization_list.wait
    expect(organization_list.item_count).to eq 2 # demo organization remains at this point

    expect(page).not_to have_text organization_name

    expect(Organization.count).to eq 2 # demo organization remains at this point
  end

  scenario "can create organizations" do
    skip "No organizations in this app" if ENV['USERS_BELONG_TO_ORGANIZATIONS'] != "true"

    user = User.admin.first
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
  end
end
