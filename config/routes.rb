Rails.application.routes.draw do
  resources :sheets, only: [:index]
  resources :movies, only: [:index, :show]
  resources :schedules, only: [:destroy]
  get '/movies/:movie_id/reservation', to: 'movies#reservation'
  get '/movies/:movie_id/schedules/:schedule_id/reservations/new', to: 'reservations#new'
  post '/reservations/', to: 'reservations#create'
  resources :users, only: [:index, :new, :create, :edit, :update, :destroy, :show]
  post '/users/create', to: 'users#create', as: :user_registration
  namespace :admin do
    resources :movies, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :schedules, only: [:index, :new, :create, :edit, :update, :destroy, :show]
    resources :reservations, only: [:index, :new, :create, :edit, :update, :destroy, :show]
    get '/movies/:movie_id/schedules/:id', to: 'schedules#show'
    delete '/movies/:movie_id/schedules/:id', to: 'schedules#destroy'
  end
end
