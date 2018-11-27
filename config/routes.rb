Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'

  resources :bikes, only: [ :new, :create, :show, :index, :edit, :update ] do
    resources :reservations, only: [ :new, :create, :edit ]
    collection do                       # collection => no restaurant id in URL
      get 'my_bike', to: "bikes#my_bike"  # RestaurantsController#top
    end
  end
end
