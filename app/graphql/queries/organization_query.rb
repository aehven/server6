module Queries
  class OrganizationQuery < Queries::BaseQuery
    description "Get one organization."

    type Types::OrganizationType, null: false

    argument :id, ID, required: true

    def resolve(id:)
      @organization =  Organization.find(id)
      if(context[:ability].can? :read, @organization)
        @organization
      else
        raise CanCan::AccessDenied
      end
    end
  end
end