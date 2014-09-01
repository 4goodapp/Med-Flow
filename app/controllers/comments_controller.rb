class CommentsController < ApplicationController

  def create
    if params[:topic_id]
      commentable = Topic.find(params[:topic_id])
      @topic = commentable
    else
      commentable = Comment.find(params[:comment_id])
      @topic = commentable.topic
    end

    #@comment = commentable.includes(:comments)
    @comment = commentable.comments.create(comment_params)
    @comment.user_id = User.find(session[:user_id]).id
    @comment.save
    redirect_to topic_path(@topic)
  end

  def show
    @comment = Comment.find(params[:id])
    @topic = @comment.topic
    redirect_to @topic
  end



  def destroy
    @topic = Topic.find(params[:topic_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to topic_path(@topic)
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end

end
