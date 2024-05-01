Rails.application.routes.draw do
  resources :sheets, only: [:index]
  resources :movies, only: [:index, :show]
  namespace :admin do
    resources :movies, only: [:index, :new, :create, :edit, :update, :destroy]
  end
end
