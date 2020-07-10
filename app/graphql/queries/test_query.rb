module Queries
  class TestQuery < Queries::BaseQuery
    description "Get one test."

    type Types::TestType, null: false

    argument :id, ID, required: true

    def resolve(id:)
      @test = Test.find(id)
      if(context[:ability].can? :read, @test)
        @test
      else
        raise CanCan::AccessDenied
      end
    end
  end
end