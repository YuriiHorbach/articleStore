Rails.application.routes.draw do
  devise_for :users
  root "articles#index"
  get "pricing", to: "static_pages#pricing"
  resources :articles
end
