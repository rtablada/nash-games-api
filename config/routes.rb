Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'status#index'
  get '/igdb-games', to: 'igdb_games#index'
end
