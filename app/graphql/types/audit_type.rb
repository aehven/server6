module Types
  class AuditType < Types::BaseObject

    field :id, ID, null: false
    field :item_type, String, null: false
    field :item_id, Integer, null: false
    field :item_subtype, String, null: true
    field :event, String, null: false
    field :whodunnit, String, null: true
    field :object, String, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: true
    field :object_changes, String, null: true
    field :comment, String, null: true
    field :json_changeset, String, null: true

    field :performed_by, String, null: true
    field :performed_by_id, Integer, null: true
    field :item_string, String, null: true
  end
end
