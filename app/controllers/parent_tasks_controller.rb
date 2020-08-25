class ParentTasksController < ApplicationController
    before_action { :authenticate_user! || :authenticate_boss!}
    before_action :authenticate_boss!, only: [:show, :index]

    def index
        @parent_tasks = current_user.parent_tasks
        #@manager_tasks = manager.teams.users.parent_tasks
    end
    def show
        @parent_task = ParentTask.find(params[:id])
        @task_comments = @parent_task.task_comments
        @task_comment = TaskComment.new
        # binding.pry
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
    end

    private

    def parent_task_params
        params.require(:parent_task).permit(:title, :explanation, :parent_deadline, :self_evaluate)
    end

end
