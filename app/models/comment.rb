class Comment < ActiveRecord::Base

	validates_presence_of :body

  has_many :tagations, :as => :tagable
  has_many :tags, :through => :tagations
  has_many :comment_scores
  belongs_to :user
  has_many :comments, :as => :commentable
  belongs_to :commentable, :polymorphic => true

  def topic
    if self.commentable_type == "Topic"
      return self.commentable
    else
      self.commentable.topic
    end
  end

end


