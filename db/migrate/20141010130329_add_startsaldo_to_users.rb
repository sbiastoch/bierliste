class AddStartsaldoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :startsaldo, :float
  end
end
