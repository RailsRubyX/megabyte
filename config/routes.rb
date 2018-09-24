Rails.application.routes.draw do
  
  devise_for :users
  
  get 'orderlist', to: 'cabinet#view'
  
  resources :posts
  resources :services
  resources :prices
  
  resources :cabinet do
  	get :show_order
  	get :show
    get :refresh
    get :show_status
  end

  resources :contacts

  root "pages#mainpage"

  get '/about', to: 'pages#about'
  #get '/clients', to: 'pages#clients'
  get '/contactus', to: 'pages#contactus'
  post '/contactus', to: 'pages#contactus'
end
