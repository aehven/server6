module Mutations
  class UserMutation < BaseMutation
    #####
    #TODO consider splitting update and create into two separate mutations
    #so that arguments can be required or optional in a stricter way.
    #Right now, everything is optional because udpate might not need them all,
    #and if ID is given then we force it to be an update.....
    #####
    argument :id, ID, required: false, description: "Must be included if updating an existing user; omit for creating a user."
    argument :email, String, required: false, description: "Must be included for new user creation."
    argument :first_name, String, required: false, description: "Must be included for new user creation."
    argument :last_name, String, required: false, description: "Must be included for new user creation."
    argument :password, String, required: false, description: "Must be included for new user creation."
    argument :role, String, required: false, description: "Must be included for new user creation."
    argument :organization_id, ID, required: false
    type Types::UserType

    def resolve(params={})
      raise CanCan::AccessDenied unless context[:current_user].can?(:create, User)

      if(params[:id].nil?)
        @user = User.create!(params)
      else
        @user = User.find(params[:id])
        @user.update_attributes(params.slice(:first_name, :last_name, :email, :password, :role))
      end

      @user
    end
  end
end