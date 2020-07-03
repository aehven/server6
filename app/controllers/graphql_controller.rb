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

    result = ServerSchema.execute(query, variables: variables, context: context, operation_name: operation_name)

    Rails.logger.debug "RESULT: #{result}"

    render json: result
  rescue => e
    #####
    # FIXME
    # NOTE THAT AUTHENTICATION ERRORS DON'T GET CAUGHT HERE BECAUSE THEY HAPPEN IN
    # application_controller.rb
    #####
    error = "#{e.class}: #{e.message}"
    logger.error error
    logger.error e.backtrace.join("\n")
    render json: { errors: [{ message: error, backtrace: (e.backtrace.join("\n") if Rails.env.development?) }] }
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
end
