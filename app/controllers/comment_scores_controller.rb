class CommentScoresController < ApplicationController
  include Votes
  before_action :set_user

  def new
    #@user = User.find(session[:user_id])
    @comment_score = CommentScore.new
  end

  def create
    #@user = User.find(session[:user_id])
    votes = @user.comment_scores.map {|score| score.comment.id }
    comment = comment_score_params[:comment_id]

    unless user_voted?(user: @user, votable_id: comment.to_i, type: :comment_score) #votes.include?(comment.to_i)
      @comment_score = @user.comment_scores.create(comment_score_params)
    end

    redirect_to :back
  end

  private

  def comment_score_params
    params.require(:comment_score).permit(:comment_id)
  end

  def set_user
    @user = User.find(session[:user_id])
  end
end
