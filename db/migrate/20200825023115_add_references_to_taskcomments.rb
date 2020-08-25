class AddReferencesToTaskcomments < ActiveRecord::Migration[6.0]
  def change
    add_reference :task_comments, :boss, foreign_key: true
    add_reference :task_comments, :child_task, foreign_key: true
  end
end
