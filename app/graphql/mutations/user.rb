module Mutations
  class User < BaseMutation
    argument :id, ID, required: false
    argument :email, String, required: false
    argument :first_name, String, required: false
    argument :last_name, String, required: false    
    argument :password, String, required: false
    argument :role, String, required: false
    argument :organization_id, ID, required: false
    type Types::UserType

    def resolve(params={})
      raise CanCan::AccessDenied unless context[:ability].can?(:create, User)

      if(params[:id].nil?)
        @user = ::User.create!(params)
      else
        @user = ::User.find(params[:id])
        @user.update_attributes(params.slice(:first_name, :last_name, :email, :password))
      end

      @user
    end
  end
end