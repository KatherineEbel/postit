# frozen_string_literal: true

# routes.rb
Rails.application.routes.draw do
  root to: 'posts#index'

  get '/register', to: 'users#new'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'


  resources :posts, except: :destroy do
    member do
      post :vote
    end
    resources :comments, only: :create do
      member do
        post :vote
      end
    end
  end
  resources :categories, only: %i[new create show]
  resources :users, except: %i[new destroy]
end
