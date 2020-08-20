class CreateUserMissions < ActiveRecord::Migration[6.0]
  def change
    create_table :user_missions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :parent_task, null: false, foreign_key: true

      t.timestamps
    end
  end
end
