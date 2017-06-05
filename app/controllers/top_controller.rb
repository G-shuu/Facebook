class TopController < ApplicationController
  def index
    @topics = Topic.page(params[:page]).per(6).order(created_at: :desc)
  end

  def show
    Notification.find(params[:notification_id]).update(read: true) if params[:notification_id]
  end
end
