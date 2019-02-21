Rails.application.routes.draw do
  root to: "pages#home"
  get "/repos", to: "pages#repos"
end
