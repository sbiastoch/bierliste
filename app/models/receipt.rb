class Receipt < ActiveRecord::Base
  belongs_to :category
  belongs_to :semester
  has_many :entries


  validates :semester_id, presence: true
  validates :category_id, presence: true
  validates :description, presence: true
  validates :date, presence: true
  validates :amount, presence: true, :numericality => true, :format => { :with => /\A\d{1,10}((,|\.)\d{0,2})?\z/ }

  scope :share_receipts, -> { where(type: 'ShareReceipt') }
  scope :simple_receipts, -> { where(type: 'SimpleReceipt') }

  def code
    if @code.nil?
      self.code = self.category.code.to_s + self.id.to_s
    else
      @code
    end
  end

  def code=(code)
    @code = code
  end
end
