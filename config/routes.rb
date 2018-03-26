Rails.application.routes.draw do
  
  devise_for :users
  
  get 'orderlist', to: 'cabinet#view'
  
  resources :posts

  resources :cabinet do
  		get :show_order
  end

  root "posts#index"

  get '/about', to: 'pages#about'
  get '/contacts', to: 'pages#contacts'
  get '/pricelist', to: 'pages#pricelist'
  get '/clients', to: 'pages#clients'
  get '/service', to: 'pages#service'

end
