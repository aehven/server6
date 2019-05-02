class ResetDoComponent < BaseComponent
  def submit_change(new_password)
    fill_in 'Password', :with => new_password
    fill_in 'Password confirmation', :with => new_password
    click_button 'Submit'
  end

  def enter_different_passwords
    fill_in 'Password', :with => "123456"
    fill_in 'Password confirmation', :with => "654321"
  end
end
