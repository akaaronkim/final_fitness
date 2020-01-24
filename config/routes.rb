Rails.application.routes.draw do
    
    resources :sessions
    get 'profiles/login', to: 'sessions#new', as: 'login'
    delete '/sessions', to: 'sessions#destroy', as: 'end_session'
    
    resources :users do
      get '/trainer', to: 'users#trainer'
      post '/coaches', to: 'coaches#create'
      delete '/coaches', to: 'coaches#destroy', as: 'delete_relationship'
      get '/profiles', to: 'profiles#show'
      get '/profiles/edit', to: 'profiles#edit'
      post '/profiles', to: 'profiles#update', as: 'workouts_profiles_update'
      
      resources :workouts do
        post '/pumps', to: 'pumps#create'
        post '/reviews', to: 'reviews#create'
      end
    end
    resources :workouts
  end

  

