Rails.application.routes.draw do
  root to: 'sessions#new'
  resources :tasks
  get 'signup', to: 'users#new'
  resources :users, except: [:new, :show, :index]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
