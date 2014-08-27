Rails.application.routes.draw do

  resources :teams
  resources :weeks
  resources :tiebreakers
  resources :games
  resources :votes

  devise_for :contestants

  get '/rules', to: 'home#rules'
  root 'home#index'
end
