class ApplicationController < ActionController::API
  VERSION = "0.0.0"

  include DeviseTokenAuth::Concerns::SetUserByToken
  include CanCan::ControllerAdditions

  before_action :set_paper_trail_whodunnit
  before_action :set_up_headers
  before_action :log_headers
  before_action :authenticate_user!, unless: :allow_unauthenticated
  before_action :configure_permitted_parameters, if: :devise_controller?
  after_action :set_up_notification

  def allow_unauthenticated
    if((controller_name == "sessions" and action_name == "create") ||
      (controller_name == "passwords" and action_name == "create") ||
      (controller_name == "registrations" and action_name == "create") ||
      (controller_name == "users" and action_name == "unsubscribe") ||
      (controller_name == "users" and action_name == "reset_password"))
      true
    else
      return false
    end
  end

  rescue_from Exception do |exception|
    logger.error "Uncaught Exception: #{exception}"
    logger.error exception.backtrace.join("\n")
    session[:exception] = exception

    render json: {exception_class: exception.class.name, exception: exception.to_s}, status: :internal_server_error
  end

  rescue_from ActionController::ParameterMissing do |exception|
    render json: {exception: exception.to_s}, status: :unprocessable_entity
  end

  rescue_from CanCan::AccessDenied do |exception|
    render json: {}, status: :forbidden
  end

  rescue_from ActiveRecord::RecordNotFound do |exception|
    render json: {}, status: :not_found
  end

  def set_up_headers
    response.headers['app-version'] = VERSION
  end

  def set_up_notification
    next_notification = current_user&.next_notification
    response.headers['notification'] = "#{NotificationSerializer.new(next_notification).attributes.to_json}" if next_notification
  end

  def log_headers
    logger.debug("Token #{request.headers['Access-Token']} from client #{request.headers['client']}")
  end

  protected

  def configure_permitted_parameters
    logger.info("configure_permitted_parameters")
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  end
end
