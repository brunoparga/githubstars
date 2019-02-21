Rails.application.routes.draw do
  root to: "pages#home"
  resources :repositories, only: :index
end
