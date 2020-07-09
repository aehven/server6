# Thanks to https://selleo.com/blog/graphql-with-ruby-on-rails-queries-in-multiple-files
# for instructions on splitting queries into these multiple classes.
module Types
  class QueryType < Types::BaseObject
    field :audits, resolver: Queries::Audits
    field :notifications, resolver: Queries::Notifications

    field :organizations, resolver: Queries::Organizations

    field :patient, resolver: Queries::Patient
    field :patients, resolver: Queries::Patients

    field :test, resolver: Queries::Test
    field :tests, resolver: Queries::Tests

    field :testPlan, resolver: Queries::TestPlan
    field :testPlans, resolver: Queries::TestPlans
    
    field :user, resolver: Queries::User
    field :users, resolver: Queries::Users
  end
end