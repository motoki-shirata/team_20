class DeleteModelUserMissions < ActiveRecord::Migration[6.0]
  def change
    drop_table :user_missions
  end
end
