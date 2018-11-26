Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'

  resources :bikes, only: [ :new, :create, :show, :index ] do
    resources :reservations, only: [ :new, :create, :edit ]
  end
end
