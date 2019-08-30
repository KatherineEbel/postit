# frozen_string_literal: true

# post.rb
class Post < ApplicationRecord
  belongs_to :creator, foreign_key: 'user_id', class_name: 'User'
  has_many :comments
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :votes, as: :voteable
  validates_presence_of :title, :description, :url
  validates_uniqueness_of :title

  after_validation :set_slug

  def total_votes
    up_votes - down_votes
  end

  def to_param
    slug
  end

  def set_slug
    self.slug = title.to_s.parameterize
  end

  private

  def up_votes
    votes.where(vote: true).size
  end

  def down_votes
    votes.where(vote: false).size
  end
end