require "rails_helper"

feature "Signing In: " do
  let(:login_component) { LoginComponent.new }
  let(:menu) { MenuComponent.new }
  let(:user) { FactoryBot.create(:user) }
  let(:home) { HomeComponent.new }

  scenario "failure" do
    login_component.sign_in_creds user.email, "wrong password"

    expect(page).to have_text "Sorry, we did not recognize your email address or password."
    expect(page).to have_button "Sign In"
  end
end
