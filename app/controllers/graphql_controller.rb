class GraphqlController < ApplicationController
  include CanCan::Ability
  
  def execute
    variables = ensure_hash(params[:variables])
    query = params[:query]
    operation_name = params[:operationName]
    context = {
      current_user: current_user,
      ability: Ability.new(current_user)
    }
    result = ServerSchema.execute(query, variables: variables, context: context, operation_name: operation_name)
    render json: result
  rescue CanCan::AccessDenied => e
    render json: { errors: [{ message: e.message }], data: {} }, status: 401
  rescue ActiveRecord::RecordNotFound => e
    render json: { errors: [{ message: e.message }], data: {} }, status: 404
  rescue ActiveRecord::RecordInvalid => e
    error_messages = e.record.errors.full_messages.join("\n")
    GraphQL::ExecutionError.new "Validation failed: #{error_messages}."
  rescue StandardError => e
    GraphQL::ExecutionError.new e.message
  rescue => e
    raise e unless Rails.env.development?
    handle_error_in_development e
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
