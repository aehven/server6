class SnackBarComponent < BaseComponent
  def selector
    "snack-bar-container"
  end

  def wait
    @comp = find(selector)
  end

  def text
    @comp.text
  end

  def action
    @comp.find("button")
  end

  def acknowledge
    action.click
  end
end
