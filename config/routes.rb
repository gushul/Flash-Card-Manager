Rails.application.routes.draw do
  root 'static_pages#index'
  resources :cards do
    member do
      put 'review'
    end
  end
end
