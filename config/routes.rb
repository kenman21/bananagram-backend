Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users
      resources :games
      resources :scores
    end
  end

  get '/games/:game_id/join', to: 'games#join'
end
