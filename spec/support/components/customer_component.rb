class CustomerComponent < BaseComponent
  def wait
    page.find ".got-customer", visible: false
  end

  def name
    find("input[formcontrolname='name']").value
  end
  def name=(value)
    fill_in 'Name', with: value
  end

  def address1
    find("input[formcontrolname='address1']").value
  end
  def address1=(value)
    fill_in 'Address 1', with: value
  end

  def address2
    find("input[formcontrolname='address2']").value
  end
  def address2=(value)
    fill_in 'Address 2', with: value
  end
end
