# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :posts
  root 'users#index'
  resources :users, only: %i[index show] do
    resources :posts do
      resources :comments, only: %i[new create destroy]
      resources :likes, only: %i[create new]
    end
  end
end
