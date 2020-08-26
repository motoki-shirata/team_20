class ParentTasksController < ApplicationController
    before_action { :authenticate_user! || :authenticate_boss!}
    # before_action :authenticate_boss!, only: [:show, :index]

    def index
        # @parent_tasks = current_user.parent_tasks
        @parent_tasks = current_user.parent_tasks.order(parent_deadline: "ASC")
    end
    def show
        @parent_task = ParentTask.find(params[:id])
        @task_comments = @parent_task.task_comments
        @task_comment = TaskComment.new
    end
    def done
        @parent_task = ParentTask.find(params[:id])
        @parent_task.parent_done = 0
        @parent_task.save
        @child_tasks = ChildTask.where(parent_task_id: @parent_task.id)
        @child_tasks.each do |child_task|
            if child_task.done == nil

                child_task.done = 0
                child_task.finish_time = Time.now
                child_task.save
            end
        end
        redirect_to parent_tasks_path
    end
    def cansel
        @parent_task = ParentTask.find(params[:id])
        @parent_task.parent_done = nil
        @parent_task.save
        redirect_to parent_tasks_path
    end
    def new
        @parent_task = ParentTask.new
    end
    def create
        @parent_task = ParentTask.new(parent_task_params)
        @parent_task.user_id = current_user.id
        if @parent_task.save
            flash[:success] = 'タスクを作成しました'
            redirect_to parent_tasks_path
        end
    end
    def destroy
        @parent_task = ParentTask.find(params[:id])
        @parent_task.destroy
        redirect_to parent_tasks_path
    end

    private

    def parent_task_params
        params.require(:parent_task).permit(:title, :explanation, :parent_deadline, :self_evaluate)
    end

end
