Rails.application.routes.draw do
  resources :sheets, only: [:index]
  resources :movies, only: [:index, :show]
  resources :schedules, only: [:destroy]
  namespace :admin do
    resources :movies, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :schedules, only: [:index, :new, :create, :edit, :update, :destroy, :show]
    get '/movies/:movie_id/schedules/:id', to: 'schedules#show'
    delete '/movies/:movie_id/schedules/:id', to: 'schedules#destroy'
  end
end
