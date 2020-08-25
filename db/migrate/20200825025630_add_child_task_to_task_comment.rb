class AddChildTaskToTaskComment < ActiveRecord::Migration[6.0]
  def change
    add_column :task_comments, :child_comment, :string
  end
end
