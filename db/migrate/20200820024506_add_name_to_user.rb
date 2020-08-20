class AddNameToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string, :unique => true, :null => false, :default => ""
  end
end
