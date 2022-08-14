Rails.application.routes.draw do
  resources :crews
  #devise_for :users
  # devise_for :users, :controllers => { registrations: 'users/registrations' }
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  get 'inicio/index'
  resources :concerts
  resources :groups
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "inicio#index"
  
end
