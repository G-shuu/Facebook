class TopicsController < ApplicationController
  before_action :topic_find_id, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @topics = Topic.all
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
    else
      render 'new'
    end
  end

  def show
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
      params.require(:topic).permit(:title, :content)
    end

    def topic_find_id
      @topic = Topic.find(params[:id])
    end
end
