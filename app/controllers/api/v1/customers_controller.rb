class Api::V1::CustomersController < ApplicationController
  load_and_authorize_resource except: [:index]

  # GET /customers
  def index
    authorize! :index, Customer

    if current_user.admin?
      @customers = Customer.all
    else
      if current_user.can? :access, :sub_customers
        @customers = current_user.customer.self_and_descendants
      else
        @customers = [current_user.customer]
      end
    end

    if !params[:search].blank?
      @customers = @customers&.search(params[:search])
    end

    total = @customers&.count

    @customers = @customers.order("lft ASC")&.paginate(per_page: params[:per_page], page: params[:page]) unless params[:name_and_ids_only]

    render json: {
      data: @customers.collect{|u| CustomerSerializer.new(u).attributes},
      meta: {
        current_page: params[:page],
        per_page: params[:per_page],
        total: total
      }
    }
  end

  # GET /customers/1
  def show
    render json: {data: CustomerSerializer.new(@customer).attributes}
  end

  # POST /customers
  def create
    if @customer.save
      if !current_user.admin?
        @customer.move_to_child_of current_user.customer
      end
      render json: {data: CustomerSerializer.new(@customer).attributes}
    else
      render json: {message: @customer.errors.full_messages.to_sentence}, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /customers/1
  def update
    if @customer.update_attributes(customer_params)
      render json: {data: CustomerSerializer.new(@customer).attributes}
    else
      render json: {message: @customer.errors.full_messages.to_sentence}, status: :unprocessable_entity
    end
  end

  # DELETE /customers/1
  def destroy
    @customer.destroy
  end

  private
    def customer_params
      params.require(:customer).permit(:name, :address1, :address2, :parent_id)
    end
end