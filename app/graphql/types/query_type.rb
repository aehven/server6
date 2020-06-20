module Types
  class QueryType < Types::BaseObject
    field :organizations, [Types::OrganizationType], null: false, description: "Return a list of all organizations"
    def organizations
      Organization.all
    end

    field :users, [Types::UserType], null: false, description: "Returns a list of all users"
    def users
      User.all
    end

    field :user, Types::UserType, null: false
    def user
      User.first
    end
  end
end
