# frozen_string_literal: true

# categories.rb
class Category < ApplicationRecord
  has_many :post_categories
  has_many :posts, through: :post_categories
  validates :name, presence: true, length: { minimum: 3 }
  after_validation :set_slug, only: %i[create update]

  def to_param
    slug
  end

  private

  def set_slug
    self.slug = name.parameterize
  end
end