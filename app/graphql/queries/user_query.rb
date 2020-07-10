module Queries
  class UserQuery < Queries::BaseQuery
    description "Get one user."

    type Types::UserType, null: false

    argument :id, ID, required: true

    def resolve(id:)
      @user = User.find(id)
      
      raise CanCan::AccessDenied unless (context[:current_user].can? :read, @user)

      @user
    end
  end
end