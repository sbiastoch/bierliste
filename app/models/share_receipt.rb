class ShareReceipt < Receipt

  def credit_users?
    puts 'cu:'+self.credit_users.inspect
    self.credit_users.to_s.length > 0
  end

  def debit_users?
    puts 'du:'+self.debit_users.inspect
    self.debit_users.to_s.length > 0
  end


  def credit_budget?
    puts 'cb:'+self.credit_budget.inspect
    self.credit_budget.to_s.length > 0
  end

  def debit_budget?
    puts 'db:'+self.debit_budget.inspect
    self.debit_budget.to_s.length > 0
  end



  def credit_budget=(c)
    if c.to_s.length > 0
      self.credits = 'B'+c
    end
  end

  def debit_budget=(u)
    if u.to_s.length > 0
      self.debits = 'B'+u
    end
  end

=begin
  def credit_radio=(d)
    @credit_radio=d
  end

  def debit_radio=(d)
    @debit_radio = d
  end



  def credit_radio
    if self.credit_budget
      'budget'
    else
      'cb'
    end
  end

  def debit_radio
    if self.debit_budget
      'budget'
    else
      'cb'
    end
  end
=end
  def credit_users
    users = self.credits.try(:dup)
    if users and users.slice!(0)=='U'
      @credit_users = users.split(',').map{ |id|
        ret = User.find(id).name

        descr = self.entries.where(user_id: id).first.try :description
        start = descr.rindex(/ · \(\d+[\.,]\d+x\)/) if descr
        start = descr.rindex(/ · \(\d+x\)/) if descr unless start

        factor = descr[start+4...descr.length-2] unless start.nil?
        ret = (factor.to_f.eql?(factor.to_i.to_f) ? factor.to_i.to_s + '*' + ret : factor.to_f.to_s + '*' + ret ) unless start.nil?
        ret
      }.join(', ')
    end
  end


  def debit_users
    users = self.debits.try(:dup)
    if users and users.slice!(0)=='U'
      @debit_users = users.split(',').map{ |id|
        ret = User.find(id).name

        descr = self.entries.where(user_id: id).first.try :description
        start = descr.rindex(/ · \(\d+[\.,]\d+x\)/) if descr
        start = descr.rindex(/ · \(\d+x\)/) if descr unless start

        factor = descr[start+4...descr.length-2] unless start.nil?
        ret = (factor.to_f.eql?(factor.to_i.to_f) ? factor.to_i.to_s + '*' + ret : factor.to_f.to_s + '*' + ret ) unless start.nil?
        ret
      }.join(', ')
    end
  end

  def credit_users=(credit_users)
    if credit_users.to_s.length > 0
      self.credits = 'U'+credit_users.split(',').map { |name|
         splitted = name.split('*')
         purename = splitted.last.strip
         purename = splitted.first.strip if splitted.last.to_f > 0 and splitted.size > 1
         puts purename.inspect
         User.where(name:purename).first.id
      }.join(',')
    end
  end

#TODO Überprüfen, ob Name existiert!
  def debit_users=(debit_users)
    if debit_users.to_s.length > 0
      self.debits = 'U'+debit_users.split(',').map {  |name|
        splitted = name.split('*')
        purename = splitted.last.strip
        purename = splitted.first.strip if splitted.last.to_i > 0 and splitted.size > 1
        User.where(name:purename).first.id
      }.join(',')
    end
  end



  def credit_budget
    if self.credits.try(:first)=='B'
      id = self.credits[1..(self.credits.size - 1)]
      Category.find(id)
    end
  end

  def debit_budget
    if self.debits.try(:first)=='B'
      id = self.debits[1..(self.debits.size - 1)]
      Category.find(id)
    end
  end
end