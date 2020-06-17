class Api::V1::OrganizationsController < ApplicationController
  load_and_authorize_resource except: [:index]

  # GET /organizations
  def index
    authorize! :index, Organization

    if current_user.admin?
      @organizations = Organization.all
    else
      if current_user.can? :access, :sub_organizations
        @organizations = current_user.organization.self_and_descendants
      else
        @organizations = [current_user.organization]
      end
    end

    if params[:kind] && params[:kind] != "all" && Organization.kinds.keys.include?(params[:kind])
      @organizations = @organizations.send(params[:kind].to_sym)
    end

    if !params[:search].blank?
      @organizations = @organizations&.search(params[:search])
    end

    total = @organizations&.count

    @organizations = @organizations.order("lft ASC")&.paginate(per_page: params[:per_page], page: params[:page]) unless params[:name_and_ids_only]

    render json: {
      data: @organizations.collect{|u| OrganizationSerializer.new(u).attributes},
      meta: {
        current_page: params[:page],
        per_page: params[:per_page],
        total: total
      }
    }
  end

  # GET /organizations/1
  def show
    render json: {data: OrganizationSerializer.new(@organization).attributes}
  end

  # POST /organizations
  def create
    if @organization.save
      if !current_user.admin?
        @organization.move_to_child_of current_user.organization
      end
      render json: {data: OrganizationSerializer.new(@organization).attributes}
    else
      render json: {message: @organization.errors.full_messages.to_sentence}, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /organizations/1
  def update
    if @organization.update_attributes(organization_params)
      render json: {data: OrganizationSerializer.new(@organization).attributes}
    else
      render json: {message: @organization.errors.full_messages.to_sentence}, status: :unprocessable_entity
    end
  end

  # DELETE /organizations/1
  def destroy
    @organization.destroy
  end

  private
    def organization_params
      params.require(:organization).permit(:name, :address1, :address2, :parent_id)
    end
end