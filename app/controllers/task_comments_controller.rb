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
