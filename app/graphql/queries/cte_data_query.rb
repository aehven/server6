module Queries
  class CteDataQuery < Queries::BaseQuery
    description "Get one CteData."

    type Types::CteDataType, null: false

    argument :id, ID, required: true

    def resolve(id:)
      CteData.find(id)
    end
  end
end