class GraphqlController < ApplicationController
  include CanCan::Ability
  
  def execute
    variables = ensure_hash(params[:variables])
    query = params[:query]
    operation_name = params[:operationName]
    context = {
      current_user: current_user,
      ability: (Ability.new(current_user) if current_user)
    }

    Rails.logger.info "execute: #{current_user} #{current_user&.ability&.inspect}"
    Rails.logger.info "execute: #{operation_name} #{query}"

    result = ServerSchema.execute(query, variables: variables, context: context, operation_name: operation_name)
    
    Rails.logger.debug "RESULT: #{result}"
    
    render json: result
  rescue CanCan::AccessDenied => e
    render json: { errors: [{ message: e.message }], data: {} }, status: 401
  rescue ActiveRecord::RecordNotFound => e
    render json: { errors: [{ message: e.message }], data: {} }, status: 404
  rescue ActiveRecord::RecordInvalid => e
    error_messages = "Invalid Record: " + e.record.errors.full_messages.join("\n")
    render json: { errors: [{ message: error_messages }], data: {} }, status: 500
  rescue StandardError => e
    render json: { errors: [{ message: e.message }], data: {} }, status: 500
  rescue => e
    raise e unless Rails.env.development?
    handle_error_in_development e
    render json: { errors: [{ message: e.message }], data: {} }, status: 500
  end

  private

  # Handle form data, JSON body, or a blank value
  def ensure_hash(ambiguous_param)
    case ambiguous_param
    when String
      if ambiguous_param.present?
        ensure_hash(JSON.parse(ambiguous_param))
      else
        {}
      end
    when Hash, ActionController::Parameters
      ambiguous_param
    when nil
      {}
    else
      raise ArgumentError, "Unexpected parameter: #{ambiguous_param}"
    end
  end

  def handle_error_in_development(e)
    logger.error e.message
    logger.error e.backtrace.join("\n")

    render json: { errors: [{ message: e.message, backtrace: e.backtrace }], data: {} }, status: 500
  end
end
