class AddUserIdToEntries < ActiveRecord::Migration
  def change
    add_reference(:entries, :user)
    add_reference(:entries, :category)
  end
end
