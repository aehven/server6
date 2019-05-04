require "rails_helper"

feature "Updating Profile: " do
  let(:login_component) { LoginComponent.new }
  let(:menu) { MenuComponent.new }
  let(:user) { UserComponent.new }
  let(:user_list) { UserListComponent.new(find("app-user-list")) }
  let(:home) { HomeComponent.new }

  scenario "update" do
    current_user = User.first

    login_component.sign_in current_user
    home.wait

    menu.profile
    user.wait

    fill_it_in
    user.role = "Admin" #fill_it_in changes user to regular, which is ok for most scenarios here but not for this one
    sleep 3 # Why on EARTH is this necessary???  Without this, user gets logged out after submit but db shows update was good
    user.submit

    current_user.reload

    expect(current_user.first_name).to eq "Paul"
    expect(current_user.last_name).to eq "McCartney"
    expect(current_user.role).to eq "admin"
    expect(current_user.email).to eq "paul@null.com"

    menu.sign_out
    login_component.show

    login_component.sign_in_creds "paul@null.com", "rspec password"
    home.wait
  end

  scenario "cancel" do
    current_user = User.first

    login_component.sign_in current_user
    home.wait

    menu.profile
    user.wait

    fill_it_in

    user.cancel
    sleep 1
    user.wait

    current_user.reload

    expect(current_user.first_name).to eq "Roger"
    expect(current_user.last_name).to eq "Waters"
    expect(current_user.role).to eq "admin"
    expect(current_user.email).to eq "admin@null.com"

    menu.sign_out
    login_component.show

    login_component.sign_in_creds "admin@null.com", "password"
    home.wait
  end


  def fill_it_in
    user.first_name = "Paul"
    user.last_name = "McCartney"
    user.email = "paul@null.com"
    user.role = "Regular"
    user.password = "rspec password"
    user.passwordConfirmation = "blah"

    expect(page).to have_text "Passwords don't match"
    expect(page).to have_button "Submit", disabled: true

    user.passwordConfirmation = "rspec password"
    expect(page).not_to have_text "Passwords don't match"
  end
end
