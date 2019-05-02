class AuditListComponent < ListComponent
  def wait
    page.find ".got-audit-list", visible: false
  end
end
