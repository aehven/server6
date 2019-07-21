class NotificationsController < ApplicationController
  load_and_authorize_resource except: [:index]

  # GET /notifications
  def index
    @notifications = current_user.notifications

    if !params[:search].blank?
      @notifications = @notifications&.search(params[:search])
    end

    total = @notifications&.count

    @notifications = @notifications&.paginate(per_page: params[:per_page], page: params[:page])

    render json: @notifications, each_serializer: NotificationSerializer, meta: {total: total}, adapter: :json
  end

  # GET /notifications/1
  def show
    render json: @notification
  end

  # POST /notifications
  def create
    @notification = Notification.new(notification_params)

    if @notification.save
      render json: @notification, status: :created, location: @notification
    else
      render json: @notification.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /notifications/1
  def update
    if @notification.update(notification_params)
      render json: @notification
    else
      render json: @notification.errors, status: :unprocessable_entity
    end
  end

  # DELETE /notifications/1
  def destroy
    @notification.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notification
      @notification = Notification.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def notification_params
      params.require(:notification).permit(:title, :text, :level, :expires_at, :in_app, :email, :sms)
    end
end
