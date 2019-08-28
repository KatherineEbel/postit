class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :creator, foreign_key: 'user_id', class_name: 'User'
  has_many :votes, as: :voteable
  validates_presence_of :body
end