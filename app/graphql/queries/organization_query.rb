module Queries
  class OrganizationQuery < Queries::BaseQuery
    description "Get one organization."

    type Types::OrganizationType, null: false

    argument :id, ID, required: true

    def resolve(id:)
      @organization =  Organization.find(id)

      raise CanCan::AccessDenied unless (context[:current_user].can? :read, @organization)

      @organization
    end
  end
end