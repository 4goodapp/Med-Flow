class User < ActiveRecord::Base

  has_secure_password

  has_many :topics
  has_many :comments


  validates :email, :username, presence: true
  #validates :email, :username, uniqueness: true
  validates :email, uniqueness: true, on: :email_changed?
  validates :password, :length => {minimum: 4}


  has_many :tagations

  has_many :tags, through: :tagations


  has_many :scores
  has_many :comment_scores
  # validates :topics, presence: true
  # validates :comments, presence: true

end
