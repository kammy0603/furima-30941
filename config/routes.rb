Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items do
    # resources :purchases
    resources :orders
  end
  # resources :purchases do
  #   resources :orders
  # end
end
