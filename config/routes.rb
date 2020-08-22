Rails.application.routes.draw do
  get 'toppages/index'
  resources :teams, only: [:new, :create, :destroy]
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  devise_for :bosses
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # root to: 'tasks'

  resources :parent_tasks do
    resources :child_tasks
  end

end
