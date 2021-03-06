class Api::V1::UsersController < ApplicationController
  load_and_authorize_resource except: [:index, :next_notification, :acknowledge_notification, :reset_password, :unsubscribe, :get_profile]

  def index
    authorize! :index, User

    if current_user.admin?
      if(params[:organization_id])
        organization = Organization.find(params[:organization_id])
        @users = organization.self_and_descendants.map(&:users).flatten
      else
        @users = User.all
      end
    else
      if current_user.can? :access, :sub_organizations
        @users = current_user.organization_forest.map(&:users).flatten
      else
        @users = current_user.organizations.map(&:users).flatten
      end
    end

    if !params[:search].blank?
      @users = @users&.search(params[:search])
    end

    total = @users&.count

    @users = @users.order(:last_name)&.paginate(per_page: params[:per_page], page: params[:page])

    render json: {
      data: @users.collect{|u| UserSerializer.new(u).attributes},
      meta: {
        current_page: params[:page],
        per_page: params[:per_page],
        total: total
      }
    }
  end

  def show
    render json: {data: UserSerializer.new(@user).attributes}
  end

  def update
    if @user.update_attributes(user_params)
      render json: {data: UserSerializer.new(@user).attributes}
    else
      render json: {message: @user.errors.full_messages.to_sentence}, status: :unprocessable_entity
    end
  end

  def create
    if @user.save
      render json: {data: UserSerializer.new(@user).attributes}
    else
      render json: {message: @user.errors.full_messages.to_sentence}, status: :unprocessable_entity
    end
  end

  def destroy
    if @user.destroy
      render json: {}
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def next_notification
    @user = User.find(params[:id])
    render json: @user.next_notification
  end

  def acknowledge_notification
    @user = User.find(params[:id])
    @user.acknowledge_notification(params[:notification_id])
    head :no_content
  end

  def reset_password
    @user = User.find_by(reset_password_token: params[:reset_password_token])

    if @user.nil?
      render(json: {}, status: 404) and return
    end

    if @user&.update_attribute(:password, params[:password])
      render json: @user, status: :ok
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def download_data
    render json: UserDownloadDataSerializer.new(@user).attributes
  end

  def unsubscribe
    User.find_by(unsubscribe_token: params[:token]).update_attribute(:unsubscribed_at, DateTime.now)
    head :ok
  end

  def get_profile
    vars = ENV.select{|k, v| k.start_with? "BTSTC_"}
    vars["BTSTC_ORGANIZATION_KINDS"] = Organization.kinds.keys
    render json: {server: vars, profile: UserSerializer.new(current_user).attributes}, status: :ok
  end

  private

  def user_params
    #current user can't create a user of a higher role.
    role = params[:user][:role]
    if role
      if User::roles[role] > User::roles[current_user.role]
        logger.warn("Reducing #{role} to #{current_user.role}")
        params[:user][:role] = current_user.role
      end
    end

    case action_name
      when "update"
        if params[:user][:password].blank?
          params[:user].delete("password")
          params[:user].delete("confirmPassword")
        end

        if(!current_user.admin?)
          params[:user].delete("role")
        end

        if(params[:user][:tac_agreed_at])
          params[:user][:tac_agreed_at] = DateTime.now
        end

        params.require(:user).permit(:email, :password, :first_name, :last_name, :address, :phone, :role, :tac_agreed_at, :active, :organization_ids, :tutorial_number)

      when "create"
        params.require(:user).require(:email)
        params.require(:user).require(:password)
        params.require(:user).require(:role)
        params.require(:user).permit(:email, :password, :first_name, :last_name, :role, :address, :phone, :active, :organization_ids)
    end
  end
end
