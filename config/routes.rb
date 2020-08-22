Rails.application.routes.draw do
  root :to => 'toppages#index'
  resources :teams, only: [:new, :create, :destroy]
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  devise_for :bosses, controllers: {
    registrations: 'bosses/registrations',
    sessions: 'bosses/sessions'
  }
  # get '/users/sign_out' => 'users/sessions#destroy'
  # get '/bosses/sign_out' => 'bosses/sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # root to: 'tasks'

  resources :parent_tasks, only: [:index, :show, :edit, :new, :create, :destroy]
  resources :child_tasks, only: [:index, :show, :edit, :new, :create, :destroy]
end
