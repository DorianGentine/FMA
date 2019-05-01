Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :users, path: "mon_espace", only: [:show, :update]

  resources :projects, only: [:update]

  get '/home', to: 'pages#home'

  resources :formularies, only: [:create, :show, :update]

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :formularies, only: [ :show, :edit, :new ]
      resources :users, only: [ :show, :update ] do
        resources :projects, only: [ :index, :show ]
      end
    end
  end

  resources :contact_forms, only: [ :create, :update, :edit ]

  root to: 'contact_forms#new'

end
