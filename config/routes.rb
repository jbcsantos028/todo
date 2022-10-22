Rails.application.routes.draw do
  root "tasks#index"
  resources :tasks
  get 'signup', to: 'users#new'
  resources :users, except: [:new]
end
