class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.integer :receipt_id
      t.date :date
      t.string :description
      t.float :amount

      t.timestamps
    end
  end
end
