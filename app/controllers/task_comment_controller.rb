class TaskCommentController < ApplicationController
    def create
        @task_comment = Task_comment.new(task_comment_params)
        @task_comment.user_id = current_user.id
        if @task_comment.save
            redirect_back(fallback_location: root_path)
        else
            redirect_back(fallback_location: root_path)
        end
    end

    def destory
        @task_comment.destory
        flash[:success] = 'コメントを削除しました。'
        redirect_back(fallback_location: root_path)
    end

    private
    def task_comment_params
        params.require(:task_comment).permit(:parent_coment)
end
