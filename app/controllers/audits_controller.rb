class AuditsController < ApplicationController
  def index
    authorize! :read, PaperTrail::Version

    @audits = PaperTrail::Version.all.order("id desc")

    include_audits = JSON.parse(params[:include])
    if include_audits.values.include? false
      include_models = include_audits.map{|k, v| k if v}.compact
      @audits = @audits.where(item_type: include_models)
    end

    @count = @audits.count

    @audits = @audits.paginate(per_page: params[:per_page], page: params[:page])

    render json: {audits: @audits.collect{|audit| AuditSerializer.new(audit).attributes}, count: @count}
  end

  def show
    authorize! :read, PaperTrail::Version

    @audit = PaperTrail::Version.find(params[:id])

    render json: AuditSerializer.new(@audit).attributes, status: :ok
  end

  def update
    authorize! :read, PaperTrail::Version

    @audit = PaperTrail::Version.find(params[:id])

    @audit.update_attributes(comment: params[:audit][:comment])

    render json: AuditSerializer.new(@audit).attributes, status: :ok
  end
end
