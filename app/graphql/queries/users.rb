module Queries
  class Users < Queries::BaseQuery
    description "Returns a list of all users"

    type [Types::UserType], null: false

    argument :page, Integer, required: false
    argument :perPage, Integer, required: false
    argument :searchTerm, String, required: false
    argument :organizationId, Integer, required: false

    def resolve(params={})
      if(context[:ability].can? :index, User)
        if(params[:organizationId])
          @users = ::Organization.find(params[:organizationId]).users
        else
          @users = ::User.all
        end
      else
        raise CanCan::AccessDenied
      end
    end
  end
end