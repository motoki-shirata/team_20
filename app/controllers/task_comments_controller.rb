class TaskCommentsController < ApplicationController
    def create
        @task_comment = TaskComment.new(task_comment_params)
        @task_comment.user_id = current_user.id
        # binding.pry
        @task_comment.parent_task_id = params[:parent_task_id]
              
        if @task_comment.save
            redirect_back(fallback_location: root_path)
        else
            redirect_back(fallback_location: root_path)
        end
    end

    def edit
        #binding.pry
        @task_comment = TaskComment.find(params[:id])
        @parent_task = @task_comment.parent_task
    end

    def update
        #binding.pry
        @task_comment = TaskComment.find(params[:id]) 
        # binding.pry
        parent_task = ParentTask.find(params[:parent_task_id])
        #binding.pry
        # @task_comment.user_id = current_user.id
        # #binding.pry
        # @task_comment.parent_task_id = params[:parent_task_id]
        #binding.pry
        if @task_comment.update(task_comment_params)
            flash[:success] = 'コメントは更新されました'
            redirect_to parent_task_path(parent_task)
        else
            flash[:danger] = 'コメントは更新に失敗しました'
            redirect_to edit_parent_task_task_comment
        end        
    end

    def destroy
        #binding.pry
        @task_comment = TaskComment.find(params[:id])
        @task_comment.destroy
        flash[:success] = 'コメントを削除しました。'
        redirect_back(fallback_location: root_path)
    end

    private
    def task_comment_params
        params.require(:task_comment).permit(:parent_comment)
    end
end
