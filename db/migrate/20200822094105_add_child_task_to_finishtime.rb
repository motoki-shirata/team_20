class AddChildTaskToFinishtime < ActiveRecord::Migration[6.0]
  def change
    add_column :child_tasks, :finish_time, :datetime
  end
end
