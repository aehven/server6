class MenuComponent < BaseComponent
  def wait
    page.find ".got-menu", visible: false
  end

  def open
    find("#menu-icon").click
    wait
  end

  def close
    find('body').click
  end

  def has?(text)
    open
    within "#menu" do
      page.has_text? text
    end
  end

  def sign_administration
    open
    find(".nav-item", text: "Sign Administration").click
  end

  def sensors
    open
    find(".nav-item", text: "Sensors").click
  end

  def users
    open
    find(".nav-item", text: "Users").click
  end

  def customers
    open
    find(".nav-item", text: "Customers").click
  end

  def notifications
    open
    find(".nav-item", text: "Notifications").click
  end

  def audit
    open
    find(".nav-item", text: "Audit").click
  end

  def profile
    open
    find(".nav-item", text: "Profile").click
  end

  def t_and_c
    open
    find(".nav-item", text: "Terms and Conditions").click
  end

  def sign_out
    open
    find(".nav-item", text: "Sign Out", match: :prefer_exact).click
    if(ENV['ALLOW_ANONYMOUS_USERS'] == "true")
      find_link "Log in"
    else
      find_button "Sign In"
    end
  end
end
