Rails.application.routes.draw do
 
  root to: "sites#index"

  get '/sessions/new', to: 'sessions#new'

  post '/sessions', to: 'sessions#create'

  delete '/sessions', to: "sessions#destroy"
  
  get '/events', to: "events#index", as: "events"

  get '/events/:id', to: 'events#show', as: "event"

  get '/events/:id/edit', to: 'events#edit', as: "edit_event"

  post "/events", to: "events#create"

  patch "/users/edit/:event_id", to: "attendings#edit", as: "remove_attending"

  #the update route 
  patch "/events/:id", to: "events#update"

  patch "/users/:id", to: "users#update"

  #the destroy route 
  delete "/events/:id", to: "events#destroy"

  get "/cities/:id/events/new", to: "events#new", as: "city_event_new"

  post '/cities/:id/events/new', to: 'events#create'

  post "/events/:event_id", to: "attendings#create", as: "attendings"

  # post to events

  # deleting user from event

  resources :users
  resources :cities do
    resources :events
  end

end
