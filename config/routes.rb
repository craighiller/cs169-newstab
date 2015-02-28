Rails.application.routes.draw do
  
  resources :articles
  
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  
  resources :users do
    resources :articles
  end
  
  root 'articles#index'

end
