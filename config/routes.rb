Rails.application.routes.draw do
  resources :movies, only: [:index]
  namespace :admin do
    resources :movies, only: [:index, :new, :create]
  end
end
