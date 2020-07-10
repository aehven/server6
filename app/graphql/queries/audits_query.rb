module Queries
  class AuditsQuery < Queries::BaseQuery
    description "Returns a list of all audit records"

    type [Types::AuditType], null: false

    argument :page, Integer, required: false
    argument :perPage, Integer, required: false
    argument :searchTerm, String, required: false

    def resolve(params={})
      if(context[:ability].can? :index, Audit)
        Audit.all
      else
        raise CanCan::AccessDenied
      end
    end
  end
end