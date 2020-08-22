class CreateTaskComments < ActiveRecord::Migration[6.0]
  def change
    create_table :task_comments do |t|
      t.string :parent_comment
      t.references :user, foreign_key: true
      t.references :parent_task, foreign_key: true

      t.timestamps
    end
  end
end
