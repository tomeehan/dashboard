Rails.application.routes.draw do
  

  resources :goals
  resources :snippets
  devise_for :users
  resources :users
  resources :posts do 
  	resources :reviews
  end

  root 'posts#index'

end
