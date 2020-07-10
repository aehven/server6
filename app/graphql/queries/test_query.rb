module Queries
  class TestQuery < Queries::BaseQuery
    description "Get one test."

    type Types::TestType, null: false

    argument :id, ID, required: true

    def resolve(id:)
      @test = Test.find(id)
      
      raise CanCan::AccessDenied unless (context[:current_user].can? :read, @test)

      @test
    end
  end
end