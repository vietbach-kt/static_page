Rails.application.routes.draw do
  get 'help' => 'static_pages#help'
  get 'about' => 'static_pages#about'
  get 'home' => 'static_pages#home'
  get 'login' => 'static_pages#login'
  get 'signup' => 'static_pages#signup'
  root 'static_pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
