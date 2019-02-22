Rails.application.routes.draw do
  root to: "pages#home"
  resources :repositories, only: :index do
    resources :repository_tags, only: :create
  end
  namespace :api, defaults: { format: :json } do
    get "/repositories/starred_by/:username",
        to: "repositories#index",
        as: :index
    get "/repositories/search_by_tag/:tag_name",
        to: "repositories#search",
        as: :search
    get "/repositories/apply_tag/:repository_id",
        to: "repository_tags#create",
        as: :apply_tag
  end
end
