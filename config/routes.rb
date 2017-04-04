Rails.application.routes.draw do
  root to: "links#index"
  get '/login' => 'sessions#new'
  

  resources :links, only: [:index]
  resources :users, only: [:new]
  resources :sessions, only: [:create]

  namespace :api do
    namespace :v1 do
      resources :links, only: [:update]
    end
  end
end
