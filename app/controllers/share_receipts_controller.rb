class ShareReceiptsController < ReceiptsController
  def create
    @receipt = receipt_class.new(receipt_params)
    Receipt.transaction do
      begin
        @receipt.semester = Semester.current
        @receipt.save!


        make_entries(
            @receipt.credit_users?,
            @receipt.debit_users?,
            @receipt.credit_budget?,
            @receipt.debit_budget?,
        )
=begin
        make_entries(
            receipt_params[:credit_radio].to_s.eql?('cb'),
            receipt_params[:debit_radio].to_s.eql?('cb'),
            !receipt_params[:credit_radio].to_s.eql?('cb'),
            !receipt_params[:debit_radio].to_s.eql?('cb'),
        )
=end
      rescue => e
        flash[:error] = 'Fehler: '+e.message
        puts e.backtrace
        render action: 'new'
      else
        redirect_to @receipt, notice: 'ShareReceipt was successfully created.'
      end
    end
  end

  def update
    @receipt.entries.delete_all


    if @receipt.update(receipt_params)

      make_entries(
          @receipt.credit_users?,
          @receipt.debit_users?,
          @receipt.credit_budget?,
          @receipt.debit_budget?,
      )
=begin
    make_entries(
        receipt_params[:credit_radio].to_s.eql?('cb'),
        receipt_params[:debit_radio].to_s.eql?('cb'),
        !receipt_params[:credit_radio].to_s.eql?('cb'),
        !receipt_params[:debit_radio].to_s.eql?('cb'),
    )
=end
      redirect_to @receipt, notice: 'ShareReceipt was successfully updated.'
    else
      render action: 'edit'
    end
  end

  private

  def make_entries(credit_users, debit_users, credit_budget, debit_budget)
    if (credit_users.to_s.length ^ credit_budget.to_s.length) and (debit_users.to_s.length ^ debit_budget.to_s.length)

      amount = receipt_params[:amount].to_s.to_f

      credit_users_str = receipt_params[:credit_users].to_s
      debit_users_str = receipt_params[:debit_users].to_s

      category = Category.find(receipt_params[:category_id]) unless receipt_params[:category_id].to_s.length == 0
      debit_category = Category.find(receipt_params[:debit_budget]) unless receipt_params[:debit_budget].to_s.length == 0
      credit_category = Category.find(receipt_params[:credit_budget]) unless receipt_params[:credit_budget].to_s.length == 0

      debit_amount  = -amount
      credit_amount = amount

      #FIXME konto -> budget, budget->budget, auszahlungen

      credit_amount *= -1 if %w'Konto Kasse Einnahmen'.include? credit_category.try :name
      debit_amount *= -1 if %w'Konto Kasse Einnahmen'.include? debit_category.try :name

      debit_amount *= -1 if credit_category and debit_category

      create_entry(credit_users_str, category, credit_amount)   if credit_users   and receipt_params[:credit_users]
      create_entry(debit_users_str, category, debit_amount)     if debit_users    and receipt_params[:debit_users]
      create_entry(nil, credit_category, credit_amount)  if credit_budget  and !credit_category.nil?
      create_entry(nil, debit_category, debit_amount)     if debit_budget   and !debit_category.nil?

    else
      puts 'Fehlende Parameter!'
    end
  end

  def receipt_params
    params.require(:ShareReceipt).permit(
        :category_id,
        :description,
        :date,
        :type,
        :amount,
        :credits,
        :debits,
        :credit_users,
        :credit_budget,
        :debit_budget,
        :debit_users,
    #    :credit_radio,
     #   :debit_radio,
        :semester_id
    )
  end
=begin
  def make_user_credit_entries

    users = get_total_parts(receipt_params[:credit_users].to_s)
    total = users.flat_map(&:values).reduce(:+)
    unit = receipt_params[:amount].to_s.to_f / total.to_f

    users.each do |name|
      the_user = User.where(name: name.keys[0]).first
      if the_user.nil?
        flash[:error] = 'Nutzer '+name.keys[0] + ' nicht gefunden!'
      else
        factor = name.values[0]
        create_user_entry(the_user, -factor * unit)
      end
    end
  end

  def make_user_debit_entries
    users = get_total_parts(receipt_params[:debit_users].to_s)
    total = users.flat_map(&:values).reduce(:+)
    unit = receipt_params[:amount].to_s.to_f / total.to_f

    users.each do |name|
      the_user = User.where(name: name.keys[0]).first
      if the_user.nil?
        flash[:error] = 'Nutzer '+name.keys[0] + ' nicht gefunden!'
      else
        factor = name.values[0]
        create_user_entry(the_user, factor * unit)
      end
    end
  end

  def make_budget_credit_entries
    category = Category.find(receipt_params[:credit_budget])
    amount = receipt_params[:amount].to_s.to_f
    amount = -amount if category.name.eql? 'Konto' or category.name.eql? 'Kasse'
    create_budget_entry(category, -amount)
  end

  def make_budget_debit_entries
    category = Category.find(receipt_params[:debit_budget])
    amount = receipt_params[:amount].to_s.to_f
    amount = -amount if category.name.eql? 'Konto' or category.name.eql? 'Kasse'
    create_budget_entry(category, amount)
  end
=end
end