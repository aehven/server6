class CustomerSerializer < ActiveModel::Serializer
  attributes :id, :name, :parent_id, :parent_name, :address1, :address2

  def parent_name
    object.parent&.name
  end
end
