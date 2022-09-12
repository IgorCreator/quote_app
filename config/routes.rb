Rails.application.routes.draw do
  root "welcome#index"
  get 'about', to: 'welcome#about'

  devise_for :users

  resources :quotes
  resources :authors
end
