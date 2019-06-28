Rails.application.routes.draw do

  require "sidekiq/web"
  authenticate :user, lambda { |u| u.admin } do
    mount Sidekiq::Web => '/sidekiq'
  end


  match "/404", :to => "http_errors#error_404", :via => :all
  match "/422", :to => "http_errors#error_422", :via => :all
  match "/500", :to => "http_errors#error_500", :via => :all

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: "users/passwords"
  }


  resources :users, path: "mon_espace", only: [:show, :update] do
    member do
      get '/projet', to: 'users#show'
      get '/compte', to: 'users#show'
        get '/compte/identite', to: 'users#show'
        get '/compte/email_mdp', to: 'users#show'
        get '/compte/suppression', to: 'users#show'
        # get '/compte/mdp', to: 'users#show'
        # get '/compte/telephone', to: 'users#show'
      get '/alertes', to: 'users#show'
        get '/alertes/notifications', to: 'users#show'
        get '/alertes/actualites', to: 'users#show'
      get '/bureau', to: 'users#show'
      get '/clients', to: 'users#show'
      get '/conseillers', to: 'users#show'
      get '/demandes', to: 'users#show'
      # get '/compte', to: 'users#show'
      get '/a_propos', to: 'users#show'
        get '/a_propos/cgu_cgv', to: 'users#show'
        get '/a_propos/protection_donnees', to: 'users#show'
    end
  end

  resources :projects, only: [:update]

  get '/home', to: 'pages#home'
  get '/prise_de_rdv', to: 'pages#prise_de_rdv'
  get '/qui-sommes-nous', to: 'pages#team', as: "equipe"
  get '/cgu_cgv', to: 'pages#cgu', as: "cgu"
  get '/rgpd', to: 'pages#rgpd', as: "rgpd"



  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      post :intercom, to: 'calendlies#intercom', as: "intercom"
      patch :update, to: 'calendlies#update', as: "update"
      resources :visitors, only: [:show, :update] do
        member do
          patch :update_formulary
          get :analyze
        end
      end
      resources :financers, only: [ :index, :show ]
      resources :ressources, only: [ :index, :create, :update, :destroy ]
      resources :documents, only: [ :update ]
      resources :formularies, only: [ :update, :edit, :show ]
      resources :notes, only: [ :update, :destroy ]
      resources :projects, only: [ :show, :update, :index ] do
        resources :requests, only: [ :create ]
        resources :kits, only: [ :create, :destroy ]
        resources :notes, only: [ :create ]
        member do
          patch :next_setp
          patch :display_hint
        end
        resources :formularies, only: [ :new, :create ]
      end
      resources :users, only: [ :show, :update, :index ] do
        collection do
          get :advisors
        end
      end
    end
  end

  resources :formularies, only: [ :show ]

  resources :contact_forms, only: [ :create, :update, :edit ]
  resources :visitors, only: [ :create, :update, :edit ]

  root to: 'contact_forms#new'

  # constraints subdomain: "calendly.com", defaults: { format: :json } do
  #   post '/api/v1/hooks' => 'calendly#create', as: :create
  # end
end


