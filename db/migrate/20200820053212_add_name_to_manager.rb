class AddNameToManager < ActiveRecord::Migration[6.0]
  def change
    add_column :managers, :name, :string
  end
end
