class CreateSemesters < ActiveRecord::Migration
  def change
    create_table :semesters do |t|
      t.date :start
      t.date :end
      t.float :cash
      t.float :bank
      t.boolean :active

      t.timestamps
    end
  end
end
