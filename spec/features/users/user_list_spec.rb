require "rails_helper"

feature "User List: " do
  let(:login_component) { LoginComponent.new }
  let(:menu) { MenuComponent.new }
  let(:home) { HomeComponent.new }
  let(:user) { UserComponent.new }
  let(:user_list) { UserListComponent.new(find("app-user-list")) }

  scenario "show all" do
    5.times { FactoryBot.create(:user) }

    current_user = User.first
    login_component.sign_in current_user
    home.wait

    menu.users
    user_list.wait

    expect(user_list.item(0).text).to eq "Roger Waters#{' at Binary Trees' if ENV['USERS_BELONG_TO_CUSTOMERS'] == 'true'}\nadmin@null.com\nadmin\nnavigate_next"
    expect(user_list.item(1).text).to eq "Dani Litani#{' at The Three Broomsticks' if ENV['USERS_BELONG_TO_CUSTOMERS'] == 'true'}\nsupervisor_c_w_s@null.com\nsupervisor\nnavigate_next"
    expect(user_list.item(2).text).to eq "Bryan Adams#{' at The Three Broomsticks' if ENV['USERS_BELONG_TO_CUSTOMERS'] == 'true'}\nmanager_c_w_s@null.com\nmanager\nnavigate_next"
    expect(user_list.item(3).text).to eq "Edie Brickell#{' at The Three Broomsticks' if ENV['USERS_BELONG_TO_CUSTOMERS'] == 'true'}\nregular_c_w_s@null.com\nregular\nnavigate_next"
    expect(user_list.item(4).text).to eq "Susanna Hoffs#{' at The Brewery' if ENV['USERS_BELONG_TO_CUSTOMERS'] == 'true'}\nregular_s@null.com\nregular\nnavigate_next"
    expect(user_list.item(5).text).to eq "Fred Chopin#{' at The Conservatory' if ENV['USERS_BELONG_TO_CUSTOMERS'] == 'true'}\nmanager_c_wo_s@null.com\nmanager\nnavigate_next"

    user_list.next_page
    last_user = User.last
    expect(user_list.item(1).text).to eq "#{last_user.first_name} #{last_user.last_name}#{' at Binary Trees' if ENV['USERS_BELONG_TO_CUSTOMERS'] == 'true'}\n#{last_user.email}\n#{last_user.role}\nnavigate_next"

    user_list.previous_page

    user_list.item(3).click
    user.wait

    expect(user.first_name).to eq "Edie"
    expect(user.last_name).to eq "Brickell"
    expect(user.email).to eq "regular_c_w_s@null.com"
    expect(user.role).to eq "Regular"
  end
end
