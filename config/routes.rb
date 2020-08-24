Rails.application.routes.draw do
  root :to => 'toppages#index'
  # resources :teams, only: [:new, :create, :destroy]
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  get '/bosses/new_team', to: 'bosses#new_team'
  patch '/bosses/new_team', to: 'bosses#post_team'

  devise_for :bosses, controllers: {
    registrations: 'bosses/registrations',
    sessions: 'bosses/sessions'
  }

  resources :bosses, only:[:index, :show, :edit, :update]
  resources :users, only:[:index, :show]
  resources :teams, only:[:show] #ボスがチームメンバーの親タスクをまとめて見る用のroutes
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # root to: 'tasks'
  resources :parent_tasks do
    resources :child_tasks do
      collection do
        post :finished
        post :index_canceled
        post :show_canceled
        post :index_result_finish
        post :show_result_finish
      end
    end

    resources :task_comments
  end
end
