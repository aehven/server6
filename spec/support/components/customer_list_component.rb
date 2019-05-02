class CustomerListComponent < ListComponent
  def wait
    page.find ".got-customer-list", visible: false
  end
end
