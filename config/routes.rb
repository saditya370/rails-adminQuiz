Rails.application.routes.draw do
  get 'download',to: "feedback#download"
  get 'preview',to: "feedback#preview"


  resources :feedback
  # get 'exercises/index'
  resources :exercises

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root'pages#home'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
