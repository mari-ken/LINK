Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  resources :users, only: [:index, :show, :edit, :update, :destroy]
  resources :rooms, only: [:index, :new, :show, :create, :edit, :update, :destroy]
  resources :chats, only: [:create, :destroy]
  resources :events, only: [:create, :destroy, :index]
end
