Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items, except: :index do
    resources :purchace, only: [:index, :create]
  end
end
