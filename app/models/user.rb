# frozen_string_literal: true

# user.rb
class User < ApplicationRecord
  has_many :comments
  has_many :posts, foreign_key: :user_id
end