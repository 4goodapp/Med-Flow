class ScoresController < ApplicationController
  include Votes

  def new
    @user = User.find(session[:user_id])
    @score = Score.new
  end

  def create
    @user = User.find(session[:user_id])
    #votes = @user.scores.map {|score| score.topic.id }
    topic = score_params[:topic_id]

    unless user_votes?(user: @user, votable_id: topic.to_i, type: :score)  #votes.include?(topic.to_i)
      @score = @user.scores.create(score_params)
      if @score.save
        redirect_to :back
      else
        redirect_to :back
      end
    else
      redirect_to :back
    end
  end

  private

  def score_params
    params.require(:score).permit(:topic_id)
  end
end
