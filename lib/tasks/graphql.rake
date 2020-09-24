require "graphql/rake_task"

# call me like this: rails graphql:schema:dump
GraphQL::RakeTask.new(
  load_schema: ->(_task) {
    require File.expand_path("../../app/graphql/server_schema", __dir__)
    ServerSchema
  }
  # ,
  # load_context: ->(_task) {
  #   { current_user: User.new(role: "admin") }
  # }
)