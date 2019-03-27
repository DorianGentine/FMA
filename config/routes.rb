Rails.application.routes.draw do

  devise_for :users

  get '/home', to: 'pages#home'

  resources :formularies, only: [:create, :show, :update]

  resources :contact_forms, only: [ :create, :update, :edit ]
  root to: 'contact_forms#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
