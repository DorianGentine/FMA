Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }

  resources :users, path: "mon_espace", only: [:show, :update]

  resources :projects, only: [:update]

  get '/home', to: 'pages#home'
  get '/qui-sommes-nous', to: 'pages#team', as: "equipe"
  get '/cgu_cgv', to: 'pages#cgu', as: "cgu"
  get '/rgpd', to: 'pages#rgpd', as: "rgpd"

  resources :formularies, only: [:create, :show, :update] do
    member do
      patch :sort
    end
  end
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :formularies, only: [ :show, :edit, :new, :update, :create]
      resources :users, only: [ :show, :update ] do
        resources :projects, only: [ :index, :show ]
      end
    end
  end

  resources :contact_forms, only: [ :create, :update, :edit ]

  root to: 'contact_forms#new'

end
