class DeleteBalanceFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :balance
  end
end
