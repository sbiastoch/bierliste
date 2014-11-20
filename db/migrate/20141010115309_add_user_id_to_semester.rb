class AddUserIdToSemester < ActiveRecord::Migration
  def change
    add_column :semesters, :user_id, :integer
  end
end
