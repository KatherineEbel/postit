# frozen_string_literal: true

# user.rb
class User < ApplicationRecord
  has_many :comments
  has_many :posts, foreign_key: :user_id
  has_secure_password validations: false

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
end