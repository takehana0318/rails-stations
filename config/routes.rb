Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  resources :sheets, only: [:index]
  resources :movies, only: %i[index show]
  resources :schedules, only: [:destroy]
  get '/reservations', to: 'reservations#index'
  get '/', to: 'rankings#index'
  get '/movies/:movie_id/reservation', to: 'movies#reservation'
  get '/movies/:movie_id/theater', to: 'movies#theater'
  get '/movies/:movie_id/schedules/:schedule_id/reservations/new', to: 'reservations#new'
  post '/reservations/', to: 'reservations#create'
  resources :users, only: %i[index new create edit update destroy show]
  namespace :admin do
    resources :movies, only: %i[index new create edit update destroy]
    resources :schedules, only: %i[index new create edit update destroy show]
    resources :reservations, only: %i[index new create edit update destroy show]
    get '/movies/:movie_id/schedules/:id', to: 'schedules#show'
    delete '/movies/:movie_id/schedules/:id', to: 'schedules#destroy'
  end
end
