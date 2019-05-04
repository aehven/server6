require "rails_helper"

xfeature "Manager permissions on customers: " do
  let(:login_component) { LoginComponent.new }
  let(:menu) { MenuComponent.new }
  let(:home) { HomeComponent.new }
  let(:customer_list) { CustomerListComponent.new(find("app-customer-list")) }
  let(:customer) { CustomerComponent.new }

  scenario "no customers menu" do
    user = User.manager.first
    login_component.sign_in user

    home.wait
    expect(menu.has?("Customers")).to be_falsy
  end

  scenario "try to get disallowed stuff" do
    user = User.manager.first
    login_component.sign_in user
    home.wait

    visit "/#/customers"
    sleep 0.5
    expect(page.current_url.include? "permission-denied").to be true

    visit "/#/customer/1"
    sleep 0.5
    expect(page.current_url.include? "permission-denied").to be true

    visit "/#/customer/2"
    sleep 0.5
    expect(page.current_url.include? "permission-denied").to be true

    visit "/#/customer/3"
    sleep 0.5
    expect(page.current_url.include? "permission-denied").to be true
  end
end
