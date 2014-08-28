Rails.application.routes.draw do

  

  namespace :admin do
    resources :weeks
  end

  devise_for :contestants

  namespace :admin do
    get '/', to: 'home#index'
    resources :teams
    resources :weeks do
      resources :games
    end
  end

  get  '/play',      to: 'play#index', as: 'play'
  post '/play/vote', to: 'play#vote',  as: 'vote'

  get '/rules', to: 'home#rules'
  root 'home#index'
end
