class ConfigChangeJob < ApplicationJob
  queue_as :config_change
  
  def perform
    ActionCable.server.broadcast("config", User.env_vars_to_client)
  end
end
