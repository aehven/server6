module Queries
  class AuditsQuery < Queries::BaseQuery
    description "Returns a list of all audit records"

    type [Types::AuditType], null: false

    argument :page, Integer, required: false
    argument :perPage, Integer, required: false
    argument :searchTerm, String, required: false

    def resolve(params={})
      raise CanCan::AccessDenied unless (context[:current_user].can? :index, Audit)

      Audit.all
    end
  end
end