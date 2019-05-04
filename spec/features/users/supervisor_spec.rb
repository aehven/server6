require "rails_helper"

xfeature "Supervisor permissions on users: " do
  let(:login_component) { LoginComponent.new }
  let(:menu) { MenuComponent.new }
  let(:home) { HomeComponent.new }
  let(:user_list) { UserListComponent.new(find("app-user-list")) }
  let(:user) { UserComponent.new }

  scenario "can index self and descendant users" do
    current_user = User.supervisor.first
    login_component.sign_in current_user

    home.wait
    menu.users
    user_list.wait

    expect(user_list.item_count).to eq 4
  end

  scenario "can read and update self and descendant users" do
    current_user = User.supervisor.first
    login_component.sign_in current_user

    home.wait
    menu.users
    user_list.wait

    (0..3).each_with_index do |i|
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

  scenario "can destroy self and descendant users" do
    current_user = User.supervisor.first
    login_component.sign_in current_user

    home.wait
    menu.users
    user_list.wait

    users = current_user.customer.self_and_descendants.map(&:users).flatten
    user_count = users.count
    users.each do |u|
      user_list.find_item(u.email).click

      user_name = u.first_name

      if u.email == current_user.email
        expect(user).not_to have_button "Delete"
        menu.users
      else
        user.delete(false)
        user.delete(true)
        user_list.wait
        user_count = user_count - 1
        expect(user_list.item_count).to eq user_count
        expect(page).not_to have_text user_name
      end
    end
  end

  scenario "can create users" do
    current_user = User.supervisor.first
    login_component.sign_in current_user

    home.wait
    menu.users
    user_list.wait
    user_list.new_item("User")

    user.first_name = "Gustav"
    user.last_name = "Holst"
    user.email = "gholst@null.com"
    user.password = "password"
    user.passwordConfirmation = "password"
    user.submit

    user_list.wait
    expect(page).to have_text "Gustav Holst"

    menu.sign_out
    login_component.wait

    current_user = User.find_by(email: "gholst@null.com")
    login_component.sign_in current_user
  end

  scenario "try to get disallowed stuff" do
    user = User.supervisor.first
    login_component.sign_in user
    home.wait

    visit "/#/user/6"
    sleep 0.5
    expect(page.current_url.include? "permission-denied").to be true
  end
end
