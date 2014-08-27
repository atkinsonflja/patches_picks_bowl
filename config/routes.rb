Rails.application.routes.draw do

  resources :rules
  resources :teams
  resources :weeks
  resources :tiebreakers
  resources :games
  resources :votes

  devise_for :contestants
  root 'home#index'
end
