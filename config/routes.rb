Rails.application.routes.draw do
  root to: "pages#home"

  resources :repositories, only: :index do
    collection do
      get 'search'
    end
    resources :repository_tags, only: :create
  end
  resources :repository_tags, only: :destroy

  get "api_doc", to: "pages#api_doc", as: :api_doc

  namespace :api, defaults: { format: :json } do
    get "/starred_by/:username",
        to: "repositories#index",
        as: :index
    post "/apply_tag/:repository_id",
        to: "repository_tags#create",
        as: :apply_tag
    get "/search_by_tag/:tag_name",
        to: "repositories#search",
        as: :search
    get "/recommend_tags/:repository_id",
        to: "repository_tags#recommend",
        as: :recommend_tag
  end
end
