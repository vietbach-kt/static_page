Rails.application.routes.draw do  
  get 'help' => 'static_pages#help'
  get 'about' => 'static_pages#about'
  get 'home' => 'static_pages#home'
  get 'login' => 'sessions#new'
  get 'welcome' => 'user#show'
  post "login"    => "sessions#create"
  delete  "logout"   => "sessions#destroy"
  get 'signup' => 'users#new'
  root 'static_pages#home'
  resources :users
  resources :account_activations, only: [:edit]
  resources :microposts,only: [:create, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
