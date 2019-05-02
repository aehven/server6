class CustomerSerializer < ActiveModel::Serializer
  attributes :id, :name, :address1, :address2
end
