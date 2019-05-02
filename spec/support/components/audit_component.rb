class AuditComponent < BaseComponent
  def wait
    page.find ".got-audit", visible: false
  end

  def comment
    find("textarea[formcontrolname='comment']").value
  end
  def comment=(value)
    fill_in "Comment", with: value
  end
end
