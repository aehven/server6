class OrganizationListComponent < ListComponent
  def wait
    page.find ".got-organization-list", visible: false
  end
end
