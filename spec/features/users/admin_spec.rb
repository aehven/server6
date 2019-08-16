require "rails_helper"

feature "Admin permissions on users: " do
  let(:login_component) { LoginComponent.new }
  let(:menu) { MenuComponent.new }
  let(:home) { HomeComponent.new }
  let(:user_list) { UserListComponent.new(find("app-users")) }
  let(:user) { UserComponent.new }

  scenario "can index all users" do
    current_user = User.admin.first
    login_component.sign_in current_user

    home.wait
    menu.select "Users"
    user_list.wait

    expect(user_list.item_count).to eq 7
  end

  scenario "can read and update all users" do
    current_user = User.admin.first
    login_component.sign_in current_user

    home.wait
    menu.users
    user_list.wait

    (0..5).each_with_index do |i|
      user_list.item(i).click
      user.wait

      user.edit unless user.email == current_user.email #editing own user is like profile update, form is enabled at the start
      original_name = user.first_name
      user.first_name = user.first_name + " edited"
      user.submit

      user_list.wait
      expect(user_list.item(i)).to have_text "#{original_name} edited"
    end
  end

  scenario "can destroy all users" do
    current_user = User.admin.first
    login_component.sign_in current_user

    home.wait
    menu.users
    user_list.wait

    User.all.each do |u|
      user_count = User.count
      user_list.find_item(u.email).click

      user_name = u.first_name

      if u.email == current_user.email
        expect(user).not_to have_button "Delete"
        menu.users
      else
        user.delete(false)
        user.delete(true)
        user_list.wait
        expect(user_list.item_count).to eq user_count-1
        expect(page).not_to have_text user_name
      end
    end
  end

  scenario "can create users" do
    current_user = User.admin.first
    login_component.sign_in current_user

    home.wait
    menu.users
    user_list.wait
    user_list.new_item("User")

    user.first_name = "Gustav"
    user.last_name = "Holst"
    user.email = "gholst@null.com"
    user.role = "Admin"

    if ENV['USERS_BELONG_TO_CUSTOMERS'] == "true"
      #if a customer's user, no admin option and reverts to regular
      user.customer = "The Brewery"
      expect(user.role).to eq "Regular"
    end

    user.password = "password"
    user.passwordConfirmation = "password"
    user.submit

    user_list.wait
    expect(page).to have_text "Gustav Holst#{' at The Brewery' if ENV['USERS_BELONG_TO_CUSTOMERS'] == 'true'}"

    menu.sign_out
    login_component.show

    current_user = User.find_by(email: "gholst@null.com")
    login_component.sign_in current_user
  end
end
