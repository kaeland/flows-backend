Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      post '/login', to: 'auth#create'
      post '/signup', to: 'users#create'
      get '/profile', to: 'users#profile'
      resources :users, only: [:index, :show, :update, :destroy ]
      resources :plants, only: [:index, :show, :create, :update]
      resources :addresses, only: [:index, :show, :create, :update]
      resources :rounds, only: [:index, :show, :create, :update]
      resources :machines, only: [:index, :show, :create, :update]
      resources :data, only: [:index, :show, :create, :update]
      resources :shifts, only: [:index, :show, :create, :update]
      resources :machine_rounds, only: [:index, :create]
      post '/machine_rounds', to: 'machine_rounds#submit_rounds'
    end
  end
end