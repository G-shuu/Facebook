class CommentsController < ApplicationController

  before_action :get_comment_id, only: [:show, :edit, :update, :destroy]

  def create
    @comment = current_user.comments.build(comment_params)
    @topic = Topic.find(params[:topic_id])
    @comment.topic_id = @topic.id

    respond_to do |format|
      if @comment.save
        format.html { redirect_to topic_path(@topic) }
        format.js { render :index }
        flash[:notice] = 'コメントしました。'
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
      flash[:notice] = 'コメントを更新しました。'
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
        flash[:notice] = 'コメントを削除しました。'
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
end
