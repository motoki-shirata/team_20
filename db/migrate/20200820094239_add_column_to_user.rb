class AddColumnToUser < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :teams, index: true
  end
end
