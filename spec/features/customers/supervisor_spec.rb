require "rails_helper"

xfeature "Supervisor permissions on customers: " do
  let(:login_component) { LoginComponent.new }
  let(:menu) { MenuComponent.new }
  let(:home) { HomeComponent.new }
  let(:customer_list) { CustomerListComponent.new(find("app-customer-list")) }
  let(:customer) { CustomerComponent.new }

  scenario "can index customer and descendants" do
    skip "No customers in this app" if ENV['USERS_BELONG_TO_CUSTOMERS'] != "true"

    user = User.supervisor.first
    login_component.sign_in user

    home.wait
    menu.customers
    customer_list.wait

    expect(customer_list.item_count).to eq 2
    expect(page).to have_text "The Three Broomsticks"
    expect(page).to have_text "The Brewery"
  end

  scenario "can read and update customer and descendants" do
    skip "No customers in this app" if ENV['USERS_BELONG_TO_CUSTOMERS'] != "true"

    user = User.supervisor.first
    login_component.sign_in user

    home.wait
    menu.customers
    customer_list.wait

    (0..1).each_with_index do |i|
      customer_list.item(i).click
      customer.edit
      original_name = customer.name
      customer.name = customer.name + " edited"
      customer.submit

      customer_list.wait
      expect(customer_list.item(i)).to have_text "#{original_name} edited"
    end
  end

  scenario "can destroy descendant customers only" do
    skip "No customers in this app" if ENV['USERS_BELONG_TO_CUSTOMERS'] != "true"

    user = User.supervisor.first
    login_component.sign_in user

    home.wait
    menu.customers
    customer_list.wait

    # deleting the first customer will not work because it contains us
    customer_list.item(0).click

    customer.delete(false)
    customer.delete(true)

    customer_list.wait
    expect(customer_list.item_count).to eq 2

    # deleting our subcustomer will work
    customer_list.item(1).click
    customer_name = customer.name

    customer.delete(false)
    customer.delete(true)

    customer_list.wait
    expect(customer_list.item_count).to eq 1
    expect(page).not_to have_text customer_name
  end

  scenario "can create subcustomers" do
    skip "No customers in this app" if ENV['USERS_BELONG_TO_CUSTOMERS'] != "true"

    user = User.supervisor.first
    login_component.sign_in user

    home.wait
    menu.customers
    customer_list.wait
    customer_list.new_item("Customer")

    customer.name = "Rspec customer"
    customer.address1 = "1234 Penny Lane"
    customer.address2 = "Suite sweet"
    customer.submit

    customer_list.wait
    expect(page).to have_text "Rspec customer"

    expect(Customer.last.parent).to eq user.customer
  end

  scenario "try to get disallowed stuff" do
    skip "No customers in this app" if ENV['USERS_BELONG_TO_CUSTOMERS'] != "true"

    user = User.supervisor.first
    login_component.sign_in user
    home.wait

    visit "/#/customer/3"
    sleep 0.5
    expect(page.current_url.include? "permission-denied").to be true
  end
end
