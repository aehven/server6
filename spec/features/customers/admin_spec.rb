require "rails_helper"

feature "Admin permissions on customers: " do
  let(:login_component) { LoginComponent.new }
  let(:menu) { MenuComponent.new }
  let(:home) { HomeComponent.new }
  let(:customer_list) { CustomerListComponent.new(find("app-customer-list")) }
  let(:customer) { CustomerComponent.new }

  scenario "can index all customers" do
    user = User.admin.first
    login_component.sign_in user

    home.wait
    menu.customers
    customer_list.wait

    expect(customer_list.item_count).to eq 4
  end

  scenario "can read and update all customers" do
    user = User.admin.first
    login_component.sign_in user

    home.wait
    menu.customers
    customer_list.wait

    (0..2).each_with_index do |i|
      customer_list.item(i).click
      customer.edit
      original_name = customer.name
      customer.name = customer.name + " edited"
      customer.submit

      customer_list.wait
      expect(customer_list.item(i)).to have_text "#{original_name} edited"
    end
  end

  scenario "can destroy all customers" do
    user = User.admin.first
    login_component.sign_in user

    initial_customer_count = Customer.count

    home.wait
    menu.customers
    customer_list.wait

    customer_list.item(0).click
    customer.wait
    customer_name = customer.name

    customer.delete(false)
    customer.delete(true)

    customer_list.wait

    # deleting the first customer also deletes its sub-customer,
    # so expect -2
    # -1 without nested customers

    expect(customer_list.item_count).to eq initial_customer_count-1
    expect(page).not_to have_text customer_name

    expect(Customer.count).to eq initial_customer_count-1

    initial_customer_count = Customer.count

    # deleting a customer without subs, expect -1 afterwards

    customer_list.item(0).click
    customer.wait
    customer_name = customer.name

    customer.delete(false)
    customer.delete(true)

    customer_list.wait
    expect(customer_list.item_count).to eq 2 # demo customer remains at this point

    expect(page).not_to have_text customer_name

    expect(Customer.count).to eq 2 # demo customer remains at this point
  end

  scenario "can create customers" do
    user = User.admin.first
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
  end
end
