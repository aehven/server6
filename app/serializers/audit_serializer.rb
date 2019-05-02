class AuditSerializer < ActiveModel::Serializer
  attributes :id, :item_type, :item_id, :item_subtype, :event, :performed_by, :performed_by_id, :created_at, :changeset, :comment, :item_string

  def performed_by
    User.find(object.terminator).to_s if object.terminator
  end

  def performed_by_id
    User.find(object.terminator).id if object.terminator
  end

  def item_string
    object.reify.to_s
  end
end
