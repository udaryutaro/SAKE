Rails.application.routes.draw do
  get 'home/index'
  devise_for :users
  resources :users, only: [ :index, :show, :edit, :update]
  get "users/:id/favorites" => "users#favorites", as: 'favorites'
  get 'otumamis/top' => 'otumamis#top'

  resources :otumamis, only: [ :top, :new, :index, :create, :show, :edit, :update, :destroy] do
    resources :comments, only: [ :create, :destroy]
    resource :favorites, only: [ :create, :destroy,]
  end

  resources :otumami_genres, only: [:new, :create]
  root to: 'otumamis#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
