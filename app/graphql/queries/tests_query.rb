module Queries
  class TestsQuery < Queries::BaseQuery
    description "Returns a list of all tests"

    type [Types::TestType], null: false

    argument :page, Integer, required: false
    argument :perPage, Integer, required: false
    argument :searchTerm, String, required: false

    def resolve(params={})
      Test.all
    end

  end
end