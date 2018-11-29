Rails.application.routes.draw do
  get 'dashboard/owner'
  get 'dashboard/renter'
  devise_for :users

  root to: 'pages#home'

  resources :bikes, only: [ :new, :create, :show, :index, :edit, :update, :destroy ] do
    resources :reservations, only: [:create]
  end
  get "/dashboard/owner", to: "dashboard#owner"
  get "/dashboard/renter", to: "dashboard#renter"
  get "/reservations/:id/validate", to: "reservations#validate", as: :validate_reservation
end
