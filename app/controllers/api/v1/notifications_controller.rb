class Api::V1::NotificationsController < ApplicationController
  load_and_authorize_resource #except: [:index]

  # GET /notifications
  def index
    # @notifications = current_user.notifications
    @notifications = @notifications.order("id desc")

    if !params[:search].blank?
      @notifications = @notifications&.search(params[:search])
    end

    total = @notifications&.count

    @notifications = @notifications&.paginate(per_page: params[:per_page], page: params[:page])

    render json: {
      data: @notifications.collect{|n| NotificationSerializer.new(n).attributes},
      meta: {
        current_page: params[:page],
        per_page: params[:per_page],
        total: total
      }
    }
  end

  # GET /notifications/1
  def show
    render json: @notification
  end

  # POST /notifications
  def create
    @notification = Notification.new(notification_params)

    if @notification.save
      render json: {data: NotificationSerializer.new(@notification).attributes}
    else
      render json: {message: @notification.errors.full_messages.to_sentence}, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /notifications/1
  def update
    if @notification.update_attributes(notification_params)
      render json: {data: NotificationSerializer.new(@notification).attributes}
    else
      render json: {message: @notification.errors.full_messages.to_sentence}, status: :unprocessable_entity
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
