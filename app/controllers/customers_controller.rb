class CustomersController < ApplicationController
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

    if(params[:names_and_ids_only])
      @customers = @customers.map{|c| [c.id, c.name]}
    end

    total = @customers&.count

    @customers = @customers&.paginate(per_page: params[:per_page], page: params[:page]) unless params[:name_and_ids_only]

    render json: @customers, each_serializer: CustomerSerializer, meta: {total: total}, adapter: :json
  end

  # GET /customers/1
  def show
    render json: @customer, status: :ok
  end

  # POST /customers
  def create

    if @customer.save
      if !current_user.admin?
        @customer.move_to_child_of current_user.customer
      end
      render json: @customer, status: :created, location: @customer
    else
      render json: @customer.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /customers/1
  def update
    if @customer.update(customer_params)
      render json: @customer, status: :ok
    else
      render json: @customer.errors, status: :unprocessable_entity
    end
  end

  # DELETE /customers/1
  def destroy
    @customer.destroy
  end

  private
    def customer_params
      params.require(:customer).permit(:name, :address1, :address2)
    end
end
