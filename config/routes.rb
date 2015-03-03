Rails.application.routes.draw do
  
  resources :articles
  
  # We must declare a path prefix for devise user operations to avoid conflicts with CRUD user operations
  # Source: https://github.com/plataformatec/devise/wiki/How-To:-Manage-users-through-a-CRUD-interface
  devise_for :users, :path_prefix => "profile", :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  
  # Handles CRUD operations (but in reality only index/show) for users.
  # This line MUST be listed after 'devise_for :users'
  resources :users, only: [:index, :show]
  
  resources :articles do
    resources :likes, only: [:create, :destroy]
    resources :comments
  end
  
  root 'articles#index'

end
