class AddCreditsAndDebitsToReceipts < ActiveRecord::Migration
  def change
    add_column :receipts, :credits, :string
    add_column :receipts, :debits, :string
  end
end
