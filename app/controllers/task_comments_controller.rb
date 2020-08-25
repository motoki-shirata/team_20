class TaskCommentsController < ApplicationController
    def create
        if user_signed_in? && (!ChildTask.find_by(id: params[:id]))
            user_parent_task_comments
            task_comment_save #parent_taskに対してSave
        elsif user_signed_in? && ChildTask.find_by(id: params[:id])
            user_child_task_comments
            child_comment_save
        elsif boss_signed_in? && (!ChildTask.find_by(id: params[:id]))
            boss_parent_task_comments
            task_comment_save
        elsif boss_signed_in? && ChildTask.find_by(id: params[:id])
            boss_child_task_comments
            child_comment_save
        end
    end
    def edit
        @task_comment = TaskComment.find(params[:id])
        @parent_task = @task_comment.parent_task
    end
    def update
        @task_comment = TaskComment.find(params[:id])
        parent_task = ParentTask.find(params[:parent_task_id])
        if  @task_comment.update(task_comment_params)
            flash[:success] = 'コメントは更新されました'
            redirect_to parent_task_path(parent_task)
        else
            flash[:danger] = 'コメントは更新に失敗しました'
            redirect_to edit_parent_task_task_comment
        end
    end
    def destroy
        @task_comment = TaskComment.find(params[:id])
        @task_comment.destroy
        flash[:success] = 'コメントを削除しました。'
        redirect_back(fallback_location: root_path)
    end

    private
    def task_comment_params
        params.require(:task_comment).permit(:parent_comment, :child_comment)
    end
    def user_parent_task_comments
        @task_comment = TaskComment.new(task_comment_params)
        @task_comment.user_id = current_user.id
        @task_comment.parent_task_id = params[:parent_task_id]
    end
    def user_child_task_comments
        @child_comment = TaskComment.new(task_comment_params)
        @child_comment.user_id = current_user.id
        @child_comment.child_task_id = params[:id]
    end
    def boss_parent_task_comments
        @task_comment = TaskComment.new(task_comment_params)
        @task_comment.boss_id = current_boss.id
        @task_comment.parent_task_id = params[:parent_task_id]
    end
    def boss_child_task_comments
        @child_comment = TaskComment.new(task_comment_params)
        @child_comment.boss_id = current_boss.id
        @child_comment.child_task_id = params[:id]
    end
    def task_comment_save
        if @task_comment.save
            redirect_back(fallback_location: root_path)
        else
            redirect_back(fallback_location: root_path)
        end
    end
    def child_comment_save
        if @child_comment.save
            redirect_to parent_task_child_tasks_path
        else
            redirect_back(fallback_location: root_path)
        end
    end
end