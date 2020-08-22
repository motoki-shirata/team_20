class ChildTasksController < ApplicationController
    before_action :authenticate_user!

    def index
       @child_tasks = ChildTask.all
    #    binding.pry
    end
    def show
    end
    def new
        @parent_task = ParentTask.find(params[:parent_task_id])
        @child_task = ChildTask.new
    end
    def create
        @child_task = ChildTask.new(child_task_params)
        @child_task.parent_task_id = params[:parent_task_id].to_i
        # binding.pry
        if @child_task.save
            flash[:success] = 'タスクを作成しました'
            redirect_to parent_tasks_path
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
        params.require(:child_task).permit(:title, :explanation, :child_deadline, :possibility)
    end
end
