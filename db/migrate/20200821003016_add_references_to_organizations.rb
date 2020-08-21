class AddReferencesToOrganizations < ActiveRecord::Migration[6.0]
  def change
    add_reference :organizations, :team, null: false, foreign_key: true
    add_reference :organizations, :boss, null: false, foreign_key: true
  end
end
