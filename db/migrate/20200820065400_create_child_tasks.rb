class CreateChildTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :child_tasks do |t|
      t.string :title
      t.datetime :child_deadline
      t.integer :possibility
      t.integer :done
      t.integer :result
      t.integer :self_motivation
      t.string :explanation
      t.references :parent_task, null: false, foreign_key: true

      t.timestamps
    end
  end
end
