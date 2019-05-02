class LoginComponent < BaseComponent
  def wait
    page.find_button "Sign In"
  end

  def show
    visit '/'
    sleep 2

    page.find_link "Log in", wait: 5
    click_on "Log in"
    wait
  end

  def sign_in(user)
    show

    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => "ribLeaDO"

    click_button 'Sign In'

    sleep 2 #wait for cable
  end

  def sign_in_creds(email, password)
    show

    fill_in 'Email', :with => email
    fill_in 'Password', :with => password

    click_on 'Sign In'
  end

  def forgot_password
    show

    click_link "Forgot your password?"
  end
end
