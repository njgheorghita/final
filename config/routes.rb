Rails.application.routes.draw do
  root to: "links#index"
  get '/login' => 'sessions#new'
  
  resources :links, only: [:index]
  post '/links' => 'links#create'
  resources :users, only: [:new, :create]
  resources :sessions, only: [:create, :destroy]

  namespace :api do
    namespace :v1 do
      resources :links, only: [:update]
    end
  end
end
