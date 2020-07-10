module Queries
  class UsersQuery < Queries::BaseQuery
    description "Returns a list of all users"

    type [Types::UserType], null: false

    argument :page, Integer, required: false
    argument :perPage, Integer, required: false
    argument :searchTerm, String, required: false
    argument :organizationId, Integer, required: false

    def resolve(params={})
      raise CanCan::AccessDenied unless (context[:current_user].can? :index, User)

      if(params[:organizationId])
        @users = Organization.find(params[:organizationId]).users
      else
        @users = User.all
      end
    end
  end
end