Rails.application.routes.draw do

  get 'relationships/following_users'
  get 'relationships/follower_users'
  devise_for :users

  root to: 'homes#top'
  get '/home/about', to: 'homes#about', as: 'about'

  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  
  resources :users do
    resource :relationships, only: [:create, :destroy]
    get 'followings', on: :member
    get 'followers', on: :member
  end

end
