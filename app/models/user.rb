# frozen_string_literal: true

# user.rb
class User < ApplicationRecord
  has_many :comments
  has_many :posts
  has_many :votes
  has_secure_password validations: false
  after_validation :set_slug, only: %i[create update]

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, on: :create, length: { minimum: 6 }

  def to_param
    slug
  end

  private

  def set_slug
    slug = username.parameterize
  end
end