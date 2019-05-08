Rails.application.routes.draw do

  match "/404", :to => "http_errors#error_404", :via => :all
  match "/422", :to => "http_errors#error_422", :via => :all
  match "/500", :to => "http_errors#error_500", :via => :all


  resources :users, path: "mon_espace", only: [:show, :update]

  resources :projects, only: [:update]

  get '/home', to: 'pages#home'
  get '/qui-sommes-nous', to: 'pages#team', as: "equipe"
  get '/cgu_cgv', to: 'pages#cgu', as: "cgu"
  get '/rgpd', to: 'pages#rgpd', as: "rgpd"

  resources :formularies, only: [ :show ]

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :formularies
      resources :users, only: [ :show, :update ] do
        resources :projects, only: [ :index, :show ]
      end
    end
  end

  devise_for :users, controllers: { registrations: 'users/registrations' }

  resources :contact_forms, only: [ :create, :update, :edit ]

  root to: 'contact_forms#new'

end
