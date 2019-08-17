class MenuComponent < BaseComponent
  def wait
    sleep 0.5
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

    sleep 0.5
  end

  def method_missing(m, *args, &block)
    select m.to_s.titleize
  end
end
