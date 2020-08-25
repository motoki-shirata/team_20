class ChildTasksController < ApplicationController
    before_action { :authenticate_user! || :authenticate_boss!}

    def index
       @child_tasks = ChildTask.all
       @parent_task = ParentTask.find_by(id: params[:parent_task_id])
       @task_comment = TaskComment.new
    end

    def show
       @child_task = ChildTask.find(params[:id])
       @task_comments = @child_task.task_comments
       @task_comment = TaskComment.new
    end

    def new
        @parent_task = ParentTask.find(params[:parent_task_id])
        @child_task = ChildTask.new
    end
    def create
        @child_task = ChildTask.new(child_task_params)
        @child_task.parent_task_id = params[:parent_task_id].to_i
        if @child_task.save
            flash[:success] = 'タスクを作成しました'
            redirect_to parent_tasks_path
        end
    end
    def destroy
    end
    def edit
    end
    def update
    end
    def index_result_finish
        resulted
        if @child_task.save
            finished
            redirect_to parent_task_child_tasks_path
        end
    end
    def show_result_finish
        resulted
        if @child_task.save
            finished
            redirect_to parent_task_path(id: @child_task.parent_task.id)
        end
    end
    def index_canceled
        canceled
        redirect_to parent_task_child_tasks_path
    end
    def show_canceled
        canceled
        redirect_to parent_task_path(id: @child_task.parent_task.id)
    end

    private
    def canceled
        @child_task = ChildTask.find_by(id: params[:id])
        @child_task.done = nil
        @child_task.finish_time = nil
        @child_task.save
    end
    def resulted
        @child_task = ChildTask.find_by(id: params[:id])
        parent_task = ParentTask.find(params[:parent_task_id])
        @child_task.result = params[:result].to_i
    end
    def finished
        time = Time.now
        @child_task = ChildTask.find_by(id: params[:id])
        @child_task.finish_time = time
        add_hour = 10800
        if @child_task.save
            if @child_task.finish_time < @child_task.child_deadline
                @child_task.done = 0
                @child_task.save
            elsif @child_task.child_deadline + add_hour > @child_task.finish_time && @child_task.finish_time >= @child_task.child_deadline
                @child_task.done = 1
                @child_task.save
            elsif @child_task.finish_time >= @child_task.child_deadline + add_hour
                @child_task.done = 2
                @child_task.save
            end
        end
    end
    def child_task_params
        params.require(:child_task).permit(:title, :explanation, :child_deadline, :possibility)
    end

end
