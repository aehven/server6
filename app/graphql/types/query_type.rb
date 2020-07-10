# Thanks to https://selleo.com/blog/graphql-with-ruby-on-rails-queries-in-multiple-files
# for instructions on splitting queries into these multiple classes.
module Types
  class QueryType < Types::BaseObject
    field :audits, resolver: Queries::Audits
    field :notifications, resolver: Queries::NotificationsQuery
    field :organizations, resolver: Queries::OrganizationsQuery
    field :user, resolver: Queries::UserQuery
    field :users, resolver: Queries::UsersQuery
  end
end