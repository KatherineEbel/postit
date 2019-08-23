# frozen_string_literal: true

# user.rb
class User < ApplicationRecord
  has_many :comments
  has_many :posts
end