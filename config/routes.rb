Rails.application.routes.draw do
  root 'homes#top'
  get 'home/about' => 'homes#about'
  
  devise_for :users
  
  resources :users,only: [:show,:index,:edit,:update] do
  # フォロー・フォロワー機能 #　
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member
  # フォロー・フォロワー機能 #
  end
  
  resources :books do
    resource :favorites,only: [:create, :destroy]
    resources :book_comments,only: [:create, :destroy]
  end
  end