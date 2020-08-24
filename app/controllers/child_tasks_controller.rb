class ChildTasksController < ApplicationController
    before_action { :authenticate_user! || :authenticate_boss!}

    def index
       @child_tasks = ChildTask.all
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
    def finished
        time = Time.now
        # binding.pry
        @child_task = ChildTask.find_by(id: params[:format])
        @child_task.finish_time = time
        add_hour = 10800
        # binding.pry
        if @child_task.save
            if @child_task.finish_time < @child_task.child_deadline
                @child_task.done = 0
                @child_task.save
            elsif @child_task.child_deadline + add_hour > @child_task.finish_time >= @child_task.child_deadline
                @child_task.done = 1
                @child_task.save
            elsif @child_task.finish_time >= @child_task.child_deadline + add_hour
                @child_task.done = 2
                @child_task.save

            end
            redirect_to parent_tasks_path
        end

    end
    def canceled
        # binding.pry
        @child_task = ChildTask.find_by(id: params[:format])
        # binding.pry
        @child_task.done = nil
        @child_task.save
        redirect_to parent_tasks_path
    end

    private
    # def deadline_time
    #     binding.pry
    #     params.require(:child_task).permit(:finish_time)
    # end

    def child_task_params
        params.require(:child_task).permit(:title, :explanation, :child_deadline, :possibility)
    end
end
