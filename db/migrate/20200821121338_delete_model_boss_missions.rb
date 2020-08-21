class DeleteModelBossMissions < ActiveRecord::Migration[6.0]
  def change
    drop_table :boss_misssions
  end
end
