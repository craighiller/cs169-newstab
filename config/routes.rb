Rails.application.routes.draw do
  
  resources :articles
  
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  
  resources :articles do
    resources :likes, only: [:create, :destroy]
    resources :comments
  end
  
  root 'articles#index'

end
