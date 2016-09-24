Rails.application.routes.draw do
  

  devise_for :users
  resources :users
  resources :posts do 
  	resources :reviews
  end

  root 'posts#index'

end
