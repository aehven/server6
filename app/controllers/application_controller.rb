class ApplicationController < ActionController::API
  VERSION = "0.0.0"

  include Knock::Authenticable

  before_action :set_up_headers
  before_action :log_headers
  before_action :authenticate_user, unless: :allow_unauthenticated
  before_action :set_current_user
  before_action :set_paper_trail_whodunnit

  def allow_unauthenticated
    if(defined?(Rails::Console) && Rails.env.development?)
      return true
    end

    if((controller_name == "sessions" and action_name == "create") ||
      (controller_name == "passwords" and action_name == "create") ||
      (controller_name == "registrations" and action_name == "create") ||
      (controller_name == "users" and action_name == "unsubscribe") ||
      (controller_name == "users" and action_name == "reset_password") ||
      (controller_name == "graphql" and action_name == "execute" && params[:query].include?("userAuthenticate")))
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

  rescue_from CanCan::AccessDenied, :with => :authorization_error
  rescue_from ActiveRecord::RecordNotFound, :with => :resource_not_found

  # rescue_from CanCan::AccessDenied do |exception|
  #   logger.debug "Access denied on #{exception.action} #{exception.subject.inspect}"
  #   render json: {}, status: :forbidden
  # end
  #
  # rescue_from ActiveRecord::RecordNotFound do |exception|
  #   render json: {}, status: :not_found
  # end

  def set_up_headers
    # Swagger UI clobbers the authorization header when present by that name, 
    # so the swagger docs specify 'auth' and here we copy that to the right header.
    request.headers['Authorization'] ||= request.headers['auth']

    response.headers['app-version'] = VERSION
  end

  def log_headers
    logger.debug("auth: #{request.headers['auth']}")
    logger.debug("Authorization: #{request.headers['Authorization']}")
  end

  protected

  def set_current_user
    # if(defined?(Rails::Console) && Rails.env.development?)
    #   User.current = @current_user = User.first
    # else
      User.current = current_user
    # end
  end
end
