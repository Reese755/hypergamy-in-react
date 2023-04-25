Rails.application.routes.draw do
  
  get 'session/create'
  get 'session/destroy'
  resources :options, only: [:index, :show, :update]
  resources :answers, only: [:index, :show, :update]
  resources :questions, only: [:index, :show, :update]
  resources :surveys, only: [:index, :show, :update]
  resources :categories, only: [:index, :show, :update]
  resources :ratings, only: [:index, :show, :create, :update]
  resources :users

  post "/login", to: "session#create"
  delete "/logout", to: "session#destroy"
  get "/me", to: "users#show"
  post "/signup", to: "users#create"
  patch "/users", to: "users#update"

  get "/ratings", to: "ratings#show"
end
