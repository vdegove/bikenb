Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'

  resources :bikes, only: [ :new, :create, :show, :index, :edit, :update ] do
    resources :reservations, only: [ :new, :create, :edit, :show] ]
  end
end
