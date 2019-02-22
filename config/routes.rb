Rails.application.routes.draw do
  root to: "pages#home"
  resources :repositories, only: :index do
    resources :repository_tags, only: :create
  end
  namespace :api, defaults: { format: :json } do
    get '/repositories/:username', to: 'repositories#index', as: :index
  end
end
