Rails.application.routes.draw do
  resources :professional_recipes
  
  get "professional_recipes/Search_by_reviews"
  
  
  #get 'sessions/new'

  #get 'sessions/create'

  #get 'sessions/destroy'
  
  resources :sessions, only: [:new, :create, :destroy]
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :users
  get 'page/index'
  root 'page#index'

  resources :recipes
  resources :categories
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
