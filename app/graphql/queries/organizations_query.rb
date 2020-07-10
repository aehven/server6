module Queries
  class OrganizationsQuery < Queries::BaseQuery
    description "Returns a list of all organizations"

    type [Types::OrganizationType], null: false

    argument :page, Integer, required: false
    argument :perPage, Integer, required: false
    argument :searchTerm, String, required: false
    argument :organizationId, Integer, required: false
    argument :kind, String, required: false

    def resolve(params={})
      raise CanCan::AccessDenied unless (context[:current_user].can? :index, Organization)

      Organization.all
    end
  end
end
