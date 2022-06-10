Rails.application.routes.draw do
  root 'static_pages#index'
  resources :cards do
    member do
      put 'review'
    end
  end
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  match '/signup',  to: 'users#new',         via: 'get'
  match '/signin',  to: 'sessions#new',      via: 'get'
  match '/signout', to: 'sessions#destroy',  via: 'delete'
  match 'sessions/new', to: 'sessions#new',  via: 'post'
end
