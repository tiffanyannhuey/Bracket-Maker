Rails.application.routes.draw do
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users do
    resources :tournaments do
      resources :teams
    end
  end

  resources :tournaments, except: [:index, :new, :create] do
    resources :teams
    resources :game_teams
  end

  resources :rounds

  # resources :tournaments, only:[:index, :show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
