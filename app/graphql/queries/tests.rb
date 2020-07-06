module Queries
  class Tests < Queries::BaseQuery
    description "Returns a list of all tests"

    type [Types::TestType], null: false

    argument :page, Integer, required: false
    argument :perPage, Integer, required: false
    argument :searchTerm, String, required: false

    def resolve(params={})
      if(context[:ability].can? :index, Notification)
        ::Test.all
      else
        raise CanCan::AccessDenied
      end
    end

  end
end