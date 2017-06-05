class CommentsController < ApplicationController
  include CommentsHelper

  before_action :get_comment_id, only: [:show, :edit, :update, :destroy]
  before_action :get_topic_id, only: [:create, :edit, :update, :destroy]

  def create
    @comment = current_user.comments.build(comment_params)
    @notification = @comment.notifications.build(user_id: @topic.user.id)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to topic_path(@topic) }
        format.js { render :index }

        unless  @comment.topic.user_id == current_user.id
          comment_pusher
        end
          comment_notification

      else
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
     if @comment.update(comment_params)
      format.html { redirect_to topic_path(@topic) }
      format.js { render :index }
     else
      format.html {render :new }
     end
    end
  end

  def destroy
    respond_to do |format|
      if @comment.destroy
        format.html { redirect_to topic_path(@topic) }
        format.js { render :index }
      else
        format.html { render :new }
      end
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:topic_id, :content)
    end

    def get_comment_id
      @comment = Comment.find(params[:id])
    end

    def get_topic_id
      @topic = Topic.find(params[:topic_id])
    end
end
