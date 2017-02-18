class Entry < ActiveRecord::Base
  belongs_to :user
  belongs_to :receipt
  belongs_to :semester
  belongs_to :category
#  validates :receipt_id, presence: true

  before_create {

puts self.inspect
    if self.user.nil?
      self.category.update_attribute(:balance, self.category.balance.to_f - self.amount)
    else
      #self.user.update_attribute(:balance, self.user.balance.to_f + self.amount)
    end
  }

  before_destroy {
    if self.user.nil?
      self.category.update_attribute(:balance, self.category.balance.to_f + self.amount)
    else
      #self.user.update_attribute(:balance, self.user.balance.to_f - self.amount)
    end
  }
end
