Rails.application.routes.draw do
  resources :articles
  get "up" => "rails/health#show", as: :rails_health_check
  root 'pages#home'
  get 'about', to: 'pages#about'
  resources :articles
  get 'signup', to: 'users#new'
  resources :users, except: [:new] #the new method already defined aobve
end
