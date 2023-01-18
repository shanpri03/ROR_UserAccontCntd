Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  #root "application#index"
 # root "bkstckmanage#index"
  resources :authuser
  resources :bkstckmanage
  resources :sbyname
  resources :sbyauthor
  get  'login', to:'bloginuser#index'
  post '/login', to:'bloginuser#create'
  get  'logout', to:'bloginlogin#destroy'
end
