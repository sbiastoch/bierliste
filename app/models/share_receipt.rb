class ShareReceipt < Receipt
=begin
  def credits
    @credits
  end
  def credits=(c)
    @credits = c
  end

  def debits
    @debits
  end
  def debits=(d)
    @debits = d
  end
=end



  def credit_users?
    @credit_users.nil? or @credit_users.to_s.empty?
  end

  def credit_users
    if @credits.try([0])=='U'
      User.find(@credits[1..(@credits.size - 1)]).all.join(', ')
    else
      @credit_users
    end
  end

  def credit_users=(credit_users)
    self.credits = 'U'+credit_users
  end



  def debit_users?
    @debit_users.nil? or @debit_users.to_s.empty?
  end

  def debit_users
    if @debits.try([0])=='U'
      User.find(@debits[1..(@debits.size - 1)]).all.join(', ')
    else
      @debit_users
    end
  end

  def debit_users=(debit_users)
    @debits = 'U'+debit_users
    @debit_users = debit_users
  end

  def credit_budget
    if self.credits.try([0])=='B'
      Category.find(self.credits[1..(self.credits.size - 1)]).first
    else
      @credit_budget
    end
  end

  def credit_budget=(c)
    @credit_budget = c
    self.credits = 'B'+c
  end

  def debit_budget
    if self.debits.try([0])=='B'
      Category.find(self.debits[1..(self.debits.size - 1)]).first
    else
      @debit_budget
    end
  end

  def debit_budget=(u)
    @debit_budget = u
    self.debits = 'B'+u
  end

  def credit_radio
    if @credit_users.to_s.empty? and @credit_budget
      if Category.find(@credit_budget).first.name.eql? 'Kasse'
        'cash'
      elsif Category.find(@credit_budget).first.name.eql? 'Konto'
        'kto'
      elsif Category.find(@credit_budget).first.name.eql? 'Einnahmen'
        'einnahmen'
      else
        'budget'
      end
    else
      'cb'
    end
  end

  def credit_radio=(d)
    @credit_radio=d
  end

  def debit_radio
    if @debit_users.to_s.empty? and @debit_budget
      if Category.find(@debit_budget).first.name.eql? 'Kasse'
        'cash'
      elsif Category.find(@debit_budget).first.name.eql? 'Konto'
        'kto'
      elsif Category.find(@debit_budget).first.name.eql? 'Konto'
        'einnahmen'
      else
        'budget'
      end
    else
      'cb'
    end
  end

  def debit_radio=(d)
    @debit_radio = d
  end
end