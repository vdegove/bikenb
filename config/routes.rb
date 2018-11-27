Rails.application.routes.draw do
  get 'dashboard/owner'
  get 'dashboard/renter'
  devise_for :users

  root to: 'pages#home'

  resources :bikes, only: [ :new, :create, :show, :index, :edit, :update ] do
    resources :reservations, only: [:create]
  end
  # resources :reservations, only: [:index]
  get "/dashboard/owner", to: "dashboard#owner"
  get "/dashboard/renter", to: "dashboard#renter"
end
