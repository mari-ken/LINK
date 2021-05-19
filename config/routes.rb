Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  resources :users, only: [:index, :show, :edit, :update, :destroy]
  resources :rooms, only: [:index, :new, :show, :create, :edit, :update, :destroy]
  resources :chats, only: [:create, :destroy]
  resources :events, only: [:create, :destroy, :index]

  resources :users, only: [:index, :show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    get '/users/:id/followings' => 'users#followings', as: 'followings'
    get '/users/:id/followers' => 'users#followers', as: 'followers'
  end
end
