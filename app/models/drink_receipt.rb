class DrinkReceipt < Receipt
  accepts_nested_attributes_for :entries,
                                :allow_destroy => true,
                                :reject_if => lambda { |c| c[:amount].to_s.to_f == 0 }
=begin
  before_create :set_entry_data
  def set_entry_data
    self.entries.each do |e|
      e.date =  Time.now
      e.category = Category.where(name: 'Getränke', semester: Semester.current).first
      e.semester = Semester.current
      e.receipt = self
    end
  end
=end
  def drinks
    @drinks = {'oettinger' => 0.5, 'sekt' => 5, 'wein' => 5}
  end

  def entries_old
    entries = {}
    User.all_for_lists.each do |user|
      entries[] = self.drinks.map do

        user = user
        date =  Time.now
        descr = 'Getränkeabrechnung'
        amount = 0
        cat = Category.where(name: 'Getränke', semester: Semester.current).first
        sem = Semester.current

        Entry.new receipt: self, date: date, description: descr, amount: amount, user: user, category: cat, semester: sem
      end
    end
    entries
  end
end