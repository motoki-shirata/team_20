class AddColumnUserParentTask < ActiveRecord::Migration[6.0]
  def change
    remove_column :task_comments, :user_id
    remove_column :task_comments, :parent_task_id
    add_reference :task_comments, :user, foreign_key: true
    add_reference :task_comments, :parent_task, foreign_key: true
  end
end
