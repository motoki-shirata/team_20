Rails.application.routes.draw do
  get 'teams/new'
  get 'teams/create'
  get 'teams/destroy'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # root to: 'tasks'

  resources :parent_tasks, only: [:index, :show, :edit, :new, :create, :destroy]
  resources :child_tasks, only: [:index, :show, :edit, :new, :create, :destroy]


end
