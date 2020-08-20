class CreateParentTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :parent_tasks do |t|
      t.string :title
      t.datetime :parent_deadline
      t.integer :self_evaluate
      t.string :explanation

      t.timestamps null: false
    end
  end
end
