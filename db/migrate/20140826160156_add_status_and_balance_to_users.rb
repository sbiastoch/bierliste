class AddStatusAndBalanceToUsers < ActiveRecord::Migration
  def change
    add_column :users, :status, :string, :default => 'F'
    add_column :users, :balance, :float, :default => '0'
  end
end
