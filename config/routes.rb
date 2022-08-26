# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  namespace :api, default: {format: :json} do 
    namespace :v1,  default: {format: :json} do
      resources :users, only: [:index, :show] do
      resources :posts, only: [:index, :show, :create] do
        resources :comments, only: [:index, :create]
      end
    end
  end
end

  resources :posts
  root 'users#index'
  resources :users, only: %i[index show] do
    resources :posts do
      resources :comments, only: %i[new create destroy]
      resources :likes, only: %i[create new]
    end
  end
end
