Rails.application.routes.draw do
  
  resources :articles
  
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  
  # resources :users do
  #   resources :articles do
  #     resources :comments
  #   end
  # end
  
  resources :articles do
    resources :comments
  end
  
  root 'articles#index'

end
