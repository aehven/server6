module Queries
  class NotificationsQuery < Queries::BaseQuery
    description "Returns a list of all notifications"

    type [Types::NotificationType], null: false

    argument :page, Integer, required: false
    argument :perPage, Integer, required: false
    argument :searchTerm, String, required: false

    def resolve(params={})
      raise CanCan::AccessDenied unless (context[:current_user].can? :index, Notification)

      Notification.all
    end

  end
end