class AddSemesterIdToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :semester_id, :integer
  end
end
