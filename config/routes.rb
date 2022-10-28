Rails.application.routes.draw do
  root to: 'sessions#new'
  resources :tasks
  get 'signup', to: 'users#new'
  resources :users, except: [:new, :show, :index]
  get 'login', to: 'sessions#new', as: 'new_user_session'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :categories
  get 'tasks_today', to: 'tasks#today', as: 'tasks_today'
end
