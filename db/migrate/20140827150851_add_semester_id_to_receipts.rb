class AddSemesterIdToReceipts < ActiveRecord::Migration
  def change
    add_column :receipts, :semester_id, :integer
  end
end
