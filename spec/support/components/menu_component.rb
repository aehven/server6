class MenuComponent < BaseComponent
  def wait
    # page.find ".got-menu", visible: false
    sleep 0.2
  end

  def open
    find("ion-menu-button").click
    wait
  end

  def close
    find('body').click
  end

  def has?(text)
    open
    within "ion-menu ion-content ion-list" do
      page.has_text? text
    end
  end

  def select(text)
    open
    find("ion-menu ion-content ion-list ion-item", text: text, match: :prefer_exact).click

    if(text == "Sign Out")
      if(ENV['ALLOW_ANONYMOUS_USERS'] == "true")
        find_link "Log in"
      else
        find_button "Sign In"
      end
    end
  end
end
