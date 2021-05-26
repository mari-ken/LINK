Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  resources :users, only: [:show, :edit, :update, :destroy]
  resources :rooms, only: [:show, :create, :edit, :update, :destroy]
  resources :chats, only: [:create, :destroy]
  resources :events, only: [:create, :destroy, :index]
  resources :users, only: [:index, :show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    get '/users/:id/followings' => 'users#followings', as: 'followings'
    get '/users/:id/followers' => 'users#followers', as: 'followers'
  end
  resources :add_user_to_groups, only: [:destroy]
  post 'add_user_to_groups/invite', to: 'add_user_to_groups#invite'
  post 'add_user_to_groups/join', to: 'add_user_to_groups#join'
end
