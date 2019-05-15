Rails.application.routes.draw do

  get 'documents/create'
  match "/404", :to => "http_errors#error_404", :via => :all
  match "/422", :to => "http_errors#error_422", :via => :all
  match "/500", :to => "http_errors#error_500", :via => :all


  resources :users, path: "mon_espace", only: [:show, :update] do
    member do
      get '/projet', to: 'users#show'
      get '/compte', to: 'users#show'
      get '/alertes', to: 'users#show'
    end

  end

  resources :projects, only: [:update]

  get '/home', to: 'pages#home'
  get '/qui-sommes-nous', to: 'pages#team', as: "equipe"
  get '/cgu_cgv', to: 'pages#cgu', as: "cgu"
  get '/rgpd', to: 'pages#rgpd', as: "rgpd"




  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :visitors, only: [:show, :update] do
        member do
          patch :update_formulary
          get :analyze
        end
      end
      resources :users, only: [ :show, :update ] do
        resources :projects, only: [ :index, :show ] do
          resources :documents, only: [ :create ]
        end
      end
    end
  end



  devise_for :users, controllers: { registrations: 'users/registrations' }



  resources :formularies, only: [ :show ]

  resources :contact_forms, only: [ :create, :update, :edit ]
  resources :visitors, only: [ :create, :update, :edit ]

  root to: 'contact_forms#new'

end
