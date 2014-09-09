class AddBalanceToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :balance, :float
  end
end
