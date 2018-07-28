Rails.application.routes.draw do
  
  devise_for :users
  
  get 'orderlist', to: 'cabinet#view'
  
  resources :posts

  resources :prices
  
  resources :cabinet do
  	get :show_order
  	get :show
  end

  resources :contacts

  root "posts#index"

  get '/about', to: 'pages#about'
  get '/clients', to: 'pages#clients'
  get '/service', to: 'pages#service'

end
