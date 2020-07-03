module Queries
  class User < Queries::BaseQuery
    description "Get one user."

    type Types::UserType, null: false

    argument :id, ID, required: true

    def resolve(id:)
      @user = ::User.find(id)
      if(context[:ability].can? :read, @user)
        @user
      else
        raise CanCan::AccessDenied
      end
    end
  end
end