Rails.application.routes.draw do
  get 'bikes/index'
  devise_for :users
  root to: 'pages#home'
end
