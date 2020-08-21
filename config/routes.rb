Rails.application.routes.draw do
  get 'teams/new' => 'teams#new'
  post 'teams/create' => 'teams#create'
  delete 'teams/destroy' => 'teams#destroy'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # root to: 'tasks'

  resources :parent_tasks, only: [:index, :show, :edit, :new, :create, :destroy]
  resources :child_tasks, only: [:index, :show, :edit, :new, :create, :destroy]


end
