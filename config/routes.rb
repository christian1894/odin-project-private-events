Rails.application.routes.draw do
  
  root 'users#sign_in'
  # get 'events', to: "events#index"

  resources :events, only: [:index, :show] do
    member do
      post 'events/:id/add_attendant', to: "events#add_attendant"
      delete 'events/:id/remove_attendant', to: "events#remove_attendant"
    end
  end
  resources :users do
    member do
      get 'new_event', controller: 'events', action: 'new'
      post 'create_event', controller: 'events', action: 'create'
      delete 'logout', controller: 'users', action: 'destroy_session!'
    end
    collection do
      get 'sign_in'
      post 'sign_in', action: 'user_session'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
