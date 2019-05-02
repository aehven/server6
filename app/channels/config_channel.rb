class ConfigChannel < ApplicationCable::Channel
  def subscribed
    logger.info("#{current_user} subscribed to ConfigChannel")

    stream_from "config"
  end
end
# ActionCable.server.broadcast("config", User.env_vars_to_client)
