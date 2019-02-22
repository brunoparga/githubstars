Rails.application.routes.draw do
  root to: "pages#home"
  resources :repositories, only: :index do
    resources :repository_tags, only: :create
  end
end
