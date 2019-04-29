Rails.application.routes.draw do

  get 'project_solutions/show'
  devise_for :users

  get '/home', to: 'pages#home'

  resources :formularies, only: [:create, :show, :update]

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :formularies, only: [ :show ]
    end
  end

  resources :contact_forms, only: [ :create, :update, :edit ]
  root to: 'contact_forms#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
