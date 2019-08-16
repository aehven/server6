class LoginComponent < BaseComponent
  def wait
    find_button "SIGN IN", disabled: true
  end

  def show
    if(ENV['ALLOW_ANONYMOUS_USERS'] == "true")
      visit '/'
      sleep 2
      # page.all "div", text: "Guest User"
      # wait_for_this { User.find_by(email: "demo@null.com").last_sign_in_at != nil }
      page.find ".got-anonymous-overlay", visible: false
      page.find_link "Log in", wait: 5
      click_on "SIGN IN"
    else
      visit '/login'
    end

    wait
  end

  def sign_in(user)
    user.update_attributes(tac_agreed_at: Time.now)

    show

    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => "password"

    click_button 'SIGN IN'

    sleep 2 #wait for cable
  end

  def sign_in_creds(email, password, auto_tac=true)
    User.find_by(email: email)&.update_attributes(tac_agreed_at: Time.now) if auto_tac

    show

    fill_in 'Email', :with => email
    fill_in 'Password', :with => password

    click_on 'SIGN IN'
  end

  def forgot_password
    show

    click_link "Forgot your password?"
  end
end
