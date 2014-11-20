class AddHereToUsers < ActiveRecord::Migration
  def change
    add_column :users, :here, :boolean
  end
end
