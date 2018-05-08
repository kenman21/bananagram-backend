Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users
      resources :games
      resources :scores
      resources :letters
      post '/letters/check', to: 'letters#check'
      post '/games/:game_id/join', to: 'games#join'
      get '/games/:game_id/peel', to: 'games#peel'
      post '/games/:game_id/winner', to: 'games#winner'
    end
  end


  mount ActionCable.server => '/cable'
end
