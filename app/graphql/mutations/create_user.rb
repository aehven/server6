module Mutations
  class CreateUser < BaseMutation
    argument :email, String, required: true
    argument :first_name, String, required: false
    argument :password, String, required: true

    type Types::UserType

    def resolve(email: nil, password: nil, first_name: nil)
      User.create!(email: email, password: password, first_name: first_name)
    end
  end
end