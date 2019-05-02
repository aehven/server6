class UserListComponent < ListComponent
  def wait
    page.find ".got-user-list", visible: false
  end
end
