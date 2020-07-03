module Types
  class QueryType < Types::BaseObject
    include CanCan::Ability

    field :organizations, [Types::OrganizationType], null: false, description: "Return a list of all organizations" do
      argument :page, Integer, required: false
      argument :perPage, Integer, required: false
      argument :searchTerm, String, required: false
      argument :organizationId, Integer, required: false
      argument :kind, String, required: false
    end
  def organizations
      if(context[:ability].can? :index, Organization)
        Organization.all
      else
        raise CanCan::AccessDenied
      end
    end

    field :users, [Types::UserType], null: false, description: "Returns a list of all users" do
      argument :page, Integer, required: false
      argument :perPage, Integer, required: false
      argument :searchTerm, String, required: false
      argument :organizationId, Integer, required: false
    end
    def users(params={})
      if(context[:ability].can? :index, User)
        User.all
      else
        raise CanCan::AccessDenied
      end
    end

    field :user, Types::UserType, null: false do
      argument :id, ID, required: true
    end
    def user(id:)
      @user = User.find(id)
      if(context[:ability].can? :read, @user)
        @user
      else
        raise CanCan::AccessDenied
      end
    end
  end
end
