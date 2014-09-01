require 'date'

class Semester < ActiveRecord::Base
  scope :current, -> {
    c = where(active: true).first
    if c.nil?
      Semester.create(
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
end
