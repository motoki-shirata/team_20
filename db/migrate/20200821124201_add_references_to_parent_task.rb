class AddReferencesToParentTask < ActiveRecord::Migration[6.0]
  def change
    add_reference :parent_tasks, :user, foreign_key: true
  end
end
