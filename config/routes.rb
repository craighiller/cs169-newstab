Rails.application.routes.draw do
  
  resources :articles
  
  resources :users do
    resources :articles
  end
  
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  
  root 'articles#index'

end
