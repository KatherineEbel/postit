# frozen_string_literal: true

# post_category.rb
class PostCategory < ApplicationRecord
  belongs_to :post
  belongs_to :category
end