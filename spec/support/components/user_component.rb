class UserComponent < BaseComponent
  def wait
    page.find ".got-user", visible: false
  end

  def first_name
    find_field("first_name").value
  end
  def first_name=(value)
    fill_in 'first_name', with: value
  end

  def last_name
    find("last_name").value
  end
  def last_name=(value)
    fill_in 'Last_Name', with: value
  end

  def email
    find_field("Email").value
  end
  def email=(value)
    fill_in 'Email', with: value
  end

  def role
    find("mat-select[formcontrolname='role']").find(".mat-select-value").text
  end
  def role=(value)
    find("mat-select[formcontrolname='role']").find(".mat-select-value").click
    find(".mat-option-text", text: value).click
  end

  def organization
    find("mat-select[formcontrolname='organization_id']").find(".mat-select-value").text
  end
  def organization=(value)
    find("mat-select[formcontrolname='organization_id']").find(".mat-select-value").click
    find(".mat-option-text", text: value).click
  end

  def password=(value)
    fill_in 'Password', with: value
  end

  def passwordConfirmation=(value)
    fill_in 'Password confirmation', with: value
  end
end
