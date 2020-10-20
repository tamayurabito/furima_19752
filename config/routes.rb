Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items, only: [:new, :create, :show] do
    resources :purchace, only: [:index, :create]
  end
end
