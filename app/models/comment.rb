class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :creator, foreign_key: 'user_id', class_name: 'User'
  has_many :votes, as: :voteable
  validates_presence_of :body

  def total_votes
    up_votes - down_votes
  end

  private

  def up_votes
    votes.where(vote: true).size
  end

  def down_votes
    votes.where(vote: false).size
  end
end