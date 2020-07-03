module Queries
  include CanCan::Ability
  
  class BaseQuery < GraphQL::Schema::Resolver
  end
end