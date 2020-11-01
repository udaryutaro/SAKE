Rails.application.routes.draw do
  get 'home/index'
  devise_for :users
  resources :users, only: [ :index, :edit, :update]
  get 'otumamis/top' => 'otumamis#top'
  resources :otumamis, only: [ :top, :new, :index, :create, :show, :edit, :update, :destroy]
  resources :otumami_genres, only: [:new, :create]
  resources :comments, only: [ :create]
  resource :favorites, only: [ :create, :destroy]

  root to: 'otumamis#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
