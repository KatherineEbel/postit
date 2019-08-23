# frozen_string_literal: true

# post.rb
class Post < ApplicationRecord
  belongs_to :creator, foreign_key: 'user_id', class_name: 'User'
  has_many :posts
  has_many :comments
end