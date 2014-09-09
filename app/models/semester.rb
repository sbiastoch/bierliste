require 'date'

class Semester < ActiveRecord::Base
  after_create :create_accounts

  scope :current, -> {
    c = where(active: true).first
    if c.nil?
      Semester.create!(
          start: Date.today,
          end: Date.today + 6.months,
          bank: 0,
          cash: 0,
          active: true
      )
    end
    c
  }
  has_many :receipts
  has_many :categories


  validates :start, presence: true
  validates :end, presence: true
  validates :bank, presence: true
  validates :cash, presence: true

  def semester_name
    s = self.start.year.to_s[2..3]
    e = self.end.year.to_s[2..3]
    if s == e
      'SS'+s
    else
      'WS'+s+'/'+e
    end
  end

  def semester_long_name
    s = self.start.year.to_s
    e = self.end.year.to_s
    if s == e
      'Sommersemester '+s
    else
      'Wintersemester '+s+'/'+e
    end
  end

  private

  def create_accounts
    Category.create! code: 'KTO', name: 'Konto', description: 'CC Konto', semester_id: self.id, amount: 0 unless self.categories.where(name:'Konto').any?
    Category.create! code: 'BAR', name: 'Kasse', description: 'Barbestand in der CC-Kasse', semester_id: self.id, amount: 0 unless self.categories.where(name:'Kasse').any?
    Category.create! code: 'EI', name: 'Einnahmen', description: 'Sonstige EInnahmen, Budgeteinzahlungen, Einnahmen aus Poena, ...', semester_id: self.id, amount: 0 unless self.categories.where(name:'Einnahmen').any?
  end
end
