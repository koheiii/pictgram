class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  validates :email, length: { minimum: 5 }
  validates :email, uniqueness: true
  validates :password, length: { minimum: 5 }

  has_many :topics
  has_many :favorites
  has_many :favorite_topics, through: :favorites, source: 'topic'
  has_many :comments
  has_many :comment_topics, through: :comments, source: 'topic'

  has_secure_password

end
