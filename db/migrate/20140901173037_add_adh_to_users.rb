class AddAdhToUsers < ActiveRecord::Migration
  def change
    add_column :users, :adh, :boolean
  end
end
