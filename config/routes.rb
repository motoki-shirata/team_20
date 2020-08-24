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

    resources :task_comments, only: [:create, :destory]
  end
end
