# frozen_string_literal: true

# routes.rb
Rails.application.routes.draw do
  root to: 'posts#index'
  resources :posts, except: :destroy do
    resources :comments, only: :create
  end
  resources :categories, only: %i[new create show]
end
