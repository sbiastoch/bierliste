class AddSemesterIdToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :semester_id, :integer
  end
end
