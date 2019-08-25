# frozen_string_literal: true

# categories.rb
class Category < ApplicationRecord
  has_many :post_categories
  has_many :posts, through: :post_categories
end