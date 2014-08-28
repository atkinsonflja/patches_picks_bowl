Rails.application.routes.draw do

  if Rails.env.production?
    constraints(:host => /^(?!picks\.taxslayerbowl\.com)/i) do
      match "/(*path)" => redirect {
        |params, req| "http://picks.taxslayerbowl.com/#{params[:path]}"
        },  via: [:get, :post]
    end
  end

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
