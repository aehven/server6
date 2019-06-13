require "rails_helper"

feature "Signing In: " do
  let(:login_component) { LoginComponent.new }
  let(:menu) { MenuComponent.new }
  let(:user) { FactoryBot.create(:user) }
  let(:home) { HomeComponent.new }

  scenario "success" do
    login_component.sign_in_creds user.email, "password", false

    expect(page).to have_css("h3", text: "Please agree to the terms and conditions below to proceed.")
    expect(page).to have_text "Lorem ipsum dolor sit amet, consectetur adipiscing elit"
    expect(page).to have_text "Ipsum suspendisse ultrices gravida dictum. Quis risus sed"

    click_on "Agree"

    expect(page).to have_text "home works!"
  end

  scenario "failure" do
    login_component.sign_in_creds user.email, "wrong password"

    expect(page).to have_text "Sorry, we did not recognize your email address or password."
    expect(page).to have_button "Sign In"
  end
end
