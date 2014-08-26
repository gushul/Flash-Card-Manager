Rails.application.routes.draw do
  root 'static_pages#index'
  resources :cards do
    member do
      post 'review'
    end
  end
end
