class AddDefaultValueToUsers < ActiveRecord::Migration
  def change
    change_column :users, :startsaldo, :float, default: 0
  end
end
