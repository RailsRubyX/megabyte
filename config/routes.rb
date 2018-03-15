Rails.application.routes.draw do
  get 'cabinet/view'
  root "pages#index"

  get '/about', to: 'pages#about'
end
