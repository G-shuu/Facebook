class TopicsController < ApplicationController

  before_action :topic_find_id, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @topics = Topic.page(params[:page]).per(6).order(created_at: :desc)
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topics_params)
    @topic.user_id = current_user.id
    if @topic.save
      redirect_to topics_path
      flash[:success] = '投稿されました'
      NoticeMailer.sendmail_topic(@topic).deliver
    else
      render 'new'
    end
  end

  def show
    Notification.find(params[:notification_id]).update(read: true) if params[:notification_id]
  end

  def edit
  end

  def update
    @topic.update(topics_params)
    redirect_to topics_path, info: '編集されました'
  end

  def destroy
    @topic.destroy
    redirect_to topics_path, danger: '削除されました'
  end

  private
    def topics_params
      params.require(:topic).permit(:content, :avatar)
    end

    def topic_find_id
      @topic = Topic.find(params[:id])
    end
end
