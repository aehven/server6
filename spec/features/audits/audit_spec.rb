require "rails_helper"

feature "Show audit list: " do
  let(:login_component) { LoginComponent.new }
  let(:menu) { MenuComponent.new }
  let(:home) { HomeComponent.new }
  let(:user) { User.first }
  let(:audit) { AuditComponent.new }
  let(:audit_list) { AuditListComponent.new(find("app-audit-list")) }

  scenario "empty then create then click in" do
    login_component.sign_in user

    home.wait
    menu.select "Audit"
    audit_list.wait

    expect(audit_list.item_count).to eq 0

    new_user = FactoryBot.create(:user)
    page.go_back
    page.go_forward
    audit_list.wait

    expect(audit_list.item_count).to eq 1

    expect(page).to have_text "Create\nUser"
    expect(page).to have_text "id initialized to #{new_user.id}"
    expect(page).to have_text "uid initialized to #{new_user.uid}"
    expect(page).to have_text "encrypted_password initialized to #{new_user.encrypted_password}"
    expect(page).to have_text "first_name initialized to #{new_user.first_name}"
    expect(page).to have_text "last_name initialized to #{new_user.last_name}"
    expect(page).to have_text "email initialized to #{new_user.email}"
    expect(page).to have_text "unsubscribe_token initialized to #{new_user.unsubscribe_token}"

    audit_list.item(0).click
    audit.wait

    expect(audit.h1).to have_text "Audit Record ID 1: create User #{new_user.id}"
    expect(page).to have_text "id initialized to #{new_user.id}"
    expect(page).to have_text "uid initialized to #{new_user.uid}"
    expect(page).to have_text "encrypted_password initialized to #{new_user.encrypted_password}"
    expect(page).to have_text "first_name initialized to #{new_user.first_name}"
    expect(page).to have_text "last_name initialized to #{new_user.last_name}"
    expect(page).to have_text "email initialized to #{new_user.email}"
    expect(page).to have_text "unsubscribe_token initialized to #{new_user.unsubscribe_token}"

    audit.edit
    audit.comment = "cancel me!"
    audit.cancel

    page.go_back
    page.go_forward

    expect(audit.h1).to have_text "Audit Record ID 1: create User #{new_user.id}"
    expect(page).not_to have_text "cancel me!"

    audit.edit
    audit.comment = "keep me!"
    audit.submit

    audit_list.wait
    audit_list.item(0).click
    audit.wait

    expect(audit.h1).to have_text "Audit Record ID 1: create User #{new_user.id}"
    expect(audit.comment).to eq "keep me!"
  end

  scenario "audit filter checkboxes" do
    login_component.sign_in user

    new_user = FactoryBot.create(:user)
    new_customer = FactoryBot.create(:customer)
    new_notification = FactoryBot.create(:notification)

    menu.audit
    audit_list.wait

    expect(audit_list.item_count).to eq 3

    item = audit_list.item(2)
    expect(item).to have_text "Create\nUser"
    expect(item).to have_text "id initialized to #{new_user.id}"
    expect(item).to have_text "uid initialized to #{new_user.uid}"
    expect(item).to have_text "encrypted_password initialized to #{new_user.encrypted_password}"
    expect(item).to have_text "first_name initialized to #{new_user.first_name}"
    expect(item).to have_text "last_name initialized to #{new_user.last_name}"
    expect(item).to have_text "email initialized to #{new_user.email}"
    expect(item).to have_text "unsubscribe_token initialized to #{new_user.unsubscribe_token}"

    item = audit_list.item(1)
    expect(item).to have_text "Create\nCustomer"
    expect(item).to have_text "id initialized to #{new_customer.id}"
    expect(item).to have_text "name initialized to #{new_customer.name}"
    # expect(item).to have_text "lft initialized to #{new_customer.lft}"
    # expect(item).to have_text "rgt initialized to #{new_customer.rgt}"

    item = audit_list.item(0)
    expect(item).to have_text "Create\nNotification"
    expect(item).to have_text "id initialized to #{new_notification.id}"
    expect(item).to have_text "text initialized to #{new_notification.text}"

    #uncheck certain filters

    audit_list.checkbox("User").click
    audit_list.wait

    expect(audit_list.item_count).to eq 2
    expect(page).not_to have_text "Create\nUser"

    audit_list.checkbox("Customer").click
    audit_list.wait

    expect(audit_list.item_count).to eq 1
    expect(page).not_to have_text "Create\nUser"
    expect(page).not_to have_text "Create\nCustomer"

    audit_list.checkbox("Notification").click
    audit_list.wait

    expect(audit_list.item_count).to eq 0
    expect(page).not_to have_text "Create\nUser"
    expect(page).not_to have_text "Create\nCustomer"
    expect(page).not_to have_text "Create\nNotification"

    #recheck them

    audit_list.checkbox("User").click
    audit_list.wait

    expect(audit_list.item_count).to eq 1
    expect(page).to have_text "Create\nUser"

    audit_list.checkbox("Customer").click
    audit_list.wait

    expect(audit_list.item_count).to eq 2
    expect(page).to have_text "Create\nUser"
    expect(page).to have_text "Create\nCustomer"

    audit_list.checkbox("Notification").click
    audit_list.wait

    expect(audit_list.item_count).to eq 3
    expect(page).to have_text "Create\nUser"
    expect(page).to have_text "Create\nCustomer"
    expect(page).to have_text "Create\nNotification"
  end

  scenario "check all audit events" do
    login_component.sign_in user

    new_customer = FactoryBot.create(:customer)
    name0 = new_customer.name
    name1 = new_customer.name + " updated"
    new_customer.update_attributes(name: name1)
    new_customer.destroy

    menu.audit
    audit_list.wait

    expect(audit_list.item_count).to eq 3

    item = audit_list.item(2)
    expect(item).to have_text "Create\nCustomer"
    expect(item).to have_text "id initialized to #{new_customer.id}"
    expect(item).to have_text "name initialized to #{name0}"
    # expect(item).to have_text "lft initialized to #{new_customer.lft}"
    # expect(item).to have_text "rgt initialized to #{new_customer.rgt}"

    item = audit_list.item(1)
    expect(item).to have_text "Update\nCustomer #{name0}"
    expect(item).to have_text "name changed from #{name0} to #{name1}"

    item = audit_list.item(0)
    expect(item).to have_text "Destroy\nCustomer #{name1}"
    expect(item).to have_text "All values erased."
  end
end
