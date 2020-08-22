class ParentTasksController < ApplicationController

    def index
        @parent_tasks = ParentTask.all
    end
    def show
        @parent_task = ParentTask.find(params[:id])
    end
    
    def new
        @parent_task = ParentTask.new
        
    end
    def create
        @parent_task = current_user.parent_tasks.build(parent_task_params)
        if @parent_task.save
            flash[:success] = 'タスクを作成しました'
            redirect_to new_parent_tasks_path
        end
    end
    def delete
        
    end

    private

    def parent_task_params
        params.require(:parent_task).permit(:title, :explanation, :parent_deadline)
    end
    
    
    
end
