Rails.application.routes.draw do
  namespace :admin do
    resources :weeks
  end

  devise_for :contestants

  namespace :admin do
    resources :teams
    resources :weeks
    resources :games
  end
  get '/admin', to: 'admin/home#index'
  get '/rules', to: 'home#rules'

  root 'home#index'
end
