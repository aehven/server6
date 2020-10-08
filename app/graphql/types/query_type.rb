# Thanks to https://selleo.com/blog/graphql-with-ruby-on-rails-queries-in-multiple-files
# for instructions on splitting queries into these multiple classes.
module Types
  class QueryType < Types::BaseObject
    field :audits, resolver: Queries::AuditsQuery

    field :baseStation, resolver: Queries::BaseStationQuery
    
    field :cteData, resolver: Queries::CteDataQuery
    field :cteDatas, resolver: Queries::CteDatasQuery
    
    field :latestFirmware, resolver: Queries::LatestFirmwareQuery

    field :notifications, resolver: Queries::NotificationsQuery

    field :organization, resolver: Queries::OrganizationQuery
    field :organizations, resolver: Queries::OrganizationsQuery

    field :patient, resolver: Queries::PatientQuery
    field :patients, resolver: Queries::PatientsQuery

    field :test, resolver: Queries::TestQuery
    field :tests, resolver: Queries::TestsQuery

    field :testPlan, resolver: Queries::TestPlanQuery
    field :testPlans, resolver: Queries::TestPlansQuery
    
    field :testPlansTest, resolver: Queries::TestPlansTestQuery
    field :testPlansTests, resolver: Queries::TestPlansTestsQuery
    
    field :user, resolver: Queries::UserQuery
    field :users, resolver: Queries::UsersQuery
  end
end