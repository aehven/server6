module Mutations
  class TestMutation < BaseMutation
    argument :id, ID, required: false
    argument :name, String, required: true

    type Types::TestType

    def resolve(id: nil, name:)
      raise CanCan::AccessDenied unless context[:ability].can? :create, ::Test

      @test = id.nil? ? Test.new : Test.find(id)

      @test.update_attributes(name: name)
      @test.save

      @test
    end
  end
end