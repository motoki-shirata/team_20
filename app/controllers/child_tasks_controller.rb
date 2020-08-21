class ChildTasksController < ApplicationController
    before_action :authenticate_user!


    def index
       @child_tasks = ChildTask.all 
    end
    def show
        @child_task = ChildTask.find(params[:id])
    end
    def new
        @child_task = ChildTask.new
    end
    def create
        @child_task = current_user.child_tasks.build(child_task_params)
        if @child_task.save
            flash[:success] = 'タスクを作成しました'
            redirect_to new_child_task
        end
    end
    def delete
        
    end
    def edit
        
    end
    def update
        
    end
    
    
    private

    def child_task_params
        params.require(:child_task).premit(:title, :child_deadline, :possibility, :result, :done, :explanation)
    end
    
    
    
end
