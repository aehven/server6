class ApplicationController < ActionController::API
  VERSION = "0.0.0"

  include DeviseTokenAuth::Concerns::SetUserByToken
  include CanCan::ControllerAdditions

  before_action :set_paper_trail_whodunnit
  before_action :set_up_headers
  before_action :log_headers
  before_action :authenticate_user!, unless: :allow_unauthenticated
  before_action :set_current_user
  before_action :configure_permitted_parameters, if: :devise_controller?

  def allow_unauthenticated
    if(defined?(Rails::Console) && Rails.env.development?)
      return true
    end

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
    logger.debug "Access denied on #{exception.action} #{exception.subject.inspect}"
    render json: {}, status: :forbidden
  end

  rescue_from ActiveRecord::RecordNotFound do |exception|
    render json: {}, status: :not_found
  end

  def set_up_headers
    response.headers['app-version'] = VERSION
  end

  def log_headers
    logger.debug("Token #{request.headers['Access-Token']} from client #{request.headers['client']}")
  end

  protected

  def configure_permitted_parameters
    logger.info("configure_permitted_parameters")
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  end

  def set_current_user
    if(defined?(Rails::Console) && Rails.env.development?)
      User.current = @current_user = User.first
    else
      User.current = current_user
    end
  end
end
