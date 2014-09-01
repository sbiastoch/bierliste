class Entry < ActiveRecord::Base
  belongs_to :user
  belongs_to :receipt

  validates :user_id, presence: true
  validates :receipt_id, presence: true
end
