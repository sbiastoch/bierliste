class Category < ActiveRecord::Base

  validates :semester_id, presence: true
  validates :semester_id, presence: true
  validates :name, presence: true
  validates :code, presence: true
  validates :amount, presence: true, :numericality => true, :format => { :with => /\A\d{1,10}((,|\.)\d{0,2})?\z/ }

  has_many :receipts
  belongs_to :semester
end
