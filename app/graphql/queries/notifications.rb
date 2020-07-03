module Queries
  class Notifications < Queries::BaseQuery
    description "Returns a list of all notifications"

    type [Types::NotificationType], null: false

    argument :page, Integer, required: false
    argument :perPage, Integer, required: false
    argument :searchTerm, String, required: false

    def resolve(params={})
      if(context[:ability].can? :index, Notification)
        ::Notification.all
      else
        raise CanCan::AccessDenied
      end
    end

  end
end