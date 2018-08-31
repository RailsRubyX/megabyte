Rails.application.routes.draw do
  
  devise_for :users
  
  get 'orderlist', to: 'cabinet#view'
  
  resources :posts

  resources :prices
  
  resources :cabinet do
  	get :show_order
  	get :show
    get :refresh
    get :show_status
  end

  root "posts#index"

  get '/about', to: 'pages#about'
  get '/contacts', to: 'pages#contacts'
  get '/clients', to: 'pages#clients'
  get '/service', to: 'pages#service'

end
