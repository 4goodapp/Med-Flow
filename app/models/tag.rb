class Tag < ActiveRecord::Base
  has_many :tagations
  has_many :topics, :through => :tagations, :source => :tagable, :source_type => "Topic"
  has_many :comments, :through => :tagations, :source => :tagable, :source_type => "Comment"
  has_many :users, :through => :tagations

  validates :subject, presence: true


end
