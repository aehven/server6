require "rails_helper"

feature "Regular permissions on customers: " do
  let(:login_component) { LoginComponent.new }
  let(:menu) { MenuComponent.new }
  let(:home) { HomeComponent.new }
  let(:customer_list) { CustomerListComponent.new(find("app-customer-list")) }
  let(:customer) { CustomerComponent.new }

  scenario "no customers menu" do
    user = User.regular.first
    login_component.sign_in user

    home.wait
    expect(menu.has?("Customers")).to be_falsy
  end

  scenario "try to get disallowed stuff" do
    user = User.regular.first
    login_component.sign_in user
    home.wait

    visit "/#/customers"
    sleep 0.5
    home.wait

    visit "/#/customer/1"
    sleep 0.5
    home.wait

    visit "/#/customer/2"
    sleep 0.5
    home.wait

    visit "/#/customer/3"
    sleep 0.5
    home.wait
  end
end
