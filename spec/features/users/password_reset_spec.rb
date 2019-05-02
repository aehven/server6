require "rails_helper"

feature "Reset password: " do
  let(:login_component) { LoginComponent.new }
  let(:reset_request) { ResetRequestComponent.new }
  let(:reset_do) { ResetDoComponent.new }
  let(:user) { FactoryBot.create(:user) }
  let(:menu) { MenuComponent.new }
  let(:dashboard) { DashboardComponent.new }

  scenario "unknown email" do
    login_component.forgot_password

    expect(reset_request.h2.text).to eq "Enter the Email You Use to Access Your Account"

    reset_request.submit_request("q@null.com")

    expect(reset_request.h3.text).to eq "Sorry, we don't know that email. Did you use a different email when you signed up?"
    expect(reset_request.h2.text).to eq "Enter the Email You Use to Access Your Account"
  end

  scenario "known email" do
    clear_mailbox

    login_component.forgot_password

    expect(reset_request.h2.text).to eq "Enter the Email You Use to Access Your Account"

    reset_request.submit_request(user.email)
    sleep 0.5

    expect(reset_request.h2.text).to eq "Thank you. You will soon receive an email with instructions for resetting your password."
    expect(reset_request.h3.text).to eq "Log In"

    email = verify_email_receipt(to: user.email, from: "aehven@binarytrees.biz", subject: "Reset password instructions")

    visit email.links.first

    reset_do.enter_different_passwords
    expect(page).to have_text "Passwords don't match."
    expect(page).to have_button "Submit", disabled: true

    reset_do.submit_change("new password")

    dashboard.wait

    menu.sign_out

    login_component.sign_in_creds user.email, "new password"

    dashboard.wait
  end
end
