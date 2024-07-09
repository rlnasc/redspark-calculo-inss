require 'sidekiq/web'

Rails.application.routes.draw do
  root to: "pages#home"

  get "/up/", to: "up#index", as: :up
  get "/up/databases", to: "up#databases", as: :up_databases

  namespace :api do
    post "/proponents/calculate_inss", to: "proponents#calculate_inss"

    resources :proponents, only: [:index, :show, :create, :update, :destroy]

    get '/reports/inss_tax', to: 'reports#inss'
  end

  mount Sidekiq::Web => "/sidekiq"
end

