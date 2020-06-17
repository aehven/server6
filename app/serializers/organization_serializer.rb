class OrganizationSerializer < ActiveModel::Serializer
  attributes :id, :kind, :name, :parent_id, :parent_name, :level, :address1, :address2

  def parent_name
    object.parent&.name
  end
end
