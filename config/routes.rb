Rails.application.routes.draw do
  

  resources :company_goals
  resources :goals
  resources :snippets
  devise_for :users
  resources :users
  resources :posts do 
  	resources :reviews
  end

  root 'company_goals#index'

end
