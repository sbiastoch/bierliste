class CreateReceipts < ActiveRecord::Migration
  def change
    create_table :receipts do |t|
      t.integer :category_id
      t.string :description
      t.date :date
      t.string :type, default: 'SimpleReceipt'
      t.float :amount

      t.timestamps
    end
  end
end
