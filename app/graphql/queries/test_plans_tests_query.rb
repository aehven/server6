module Queries
  class TestPlansTestsQuery < Queries::BaseQuery
    description "Returns a list of all test-plans-tests"

    type [Types::TestPlansTestType], null: false

    argument :page, Integer, required: false
    argument :perPage, Integer, required: false
    argument :searchTerm, String, required: false

    def resolve(params={})
      TestPlansTest.all
    end

  end
end