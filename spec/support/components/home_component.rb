class HomeComponent < BaseComponent
  def wait
    page.find ".got-home", visible: false
  end
end
