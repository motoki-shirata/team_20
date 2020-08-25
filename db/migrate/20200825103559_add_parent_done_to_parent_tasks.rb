class AddParentDoneToParentTasks < ActiveRecord::Migration[6.0]
  def change
    add_column :parent_tasks, :parent_done, :integer
  end
end
