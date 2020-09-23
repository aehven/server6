module Queries
  class CteDatasQuery < Queries::BaseQuery
    description "Returns a list of all cte data"

    type [Types::CteDataType], null: false

    argument :page, Integer, required: false
    argument :perPage, Integer, required: false
    argument :cteId, Integer, required: true

    def resolve(params={})
      user = context[:current_user]

      Cte.find(params[:cteId]).cte_datas
    end
  end
end