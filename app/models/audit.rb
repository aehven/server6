class Audit < PaperTrail::Version
  self.table_name = "versions"

  def performed_by
    User.find(terminator).to_s if terminator
  end

  def performed_by_id
    User.find(terminator).id if terminator
  end

  def item_string
    reify.to_s
  end

  def json_changeset
    changeset.to_json
  end
end