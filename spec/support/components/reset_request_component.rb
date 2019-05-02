class ResetRequestComponent < BaseComponent
  def submit_request(email)
    fill_in 'Email', :with => email
    click_button 'Submit'
    sleep 2
  end
end
