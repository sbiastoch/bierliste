class ShareReceiptsController < ReceiptsController
  def create
    @receipt = receipt_class.new(receipt_params)
    Receipt.transaction do
      begin
        @receipt.semester = Semester.current
        @receipt.save!


        make_entries(
            receipt_params[:credit_radio].to_s.eql?('cb'),
            receipt_params[:debit_radio].to_s.eql?('cb'),
            !receipt_params[:credit_radio].to_s.eql?('cb'),
            !receipt_params[:debit_radio].to_s.eql?('cb'),
        )

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

    make_entries(
        receipt_params[:credit_radio].to_s.eql?('cb'),
        receipt_params[:debit_radio].to_s.eql?('cb'),
        !receipt_params[:credit_radio].to_s.eql?('cb'),
        !receipt_params[:debit_radio].to_s.eql?('cb'),
    )

    if @receipt.update(receipt_params)
      redirect_to @receipt, notice: 'ShareReceipt was successfully updated.'
    else
      render action: 'edit'
    end
  end

  private

  def make_entries(credit_users, debit_users, credit_budget, debit_budget)
    if (credit_users ^ credit_budget) and (debit_users ^ debit_budget)

      amount = receipt_params[:amount].to_s.to_f
      main_category = Category.find(receipt_params[:category_id]) unless receipt_params[:category_id].nil?
      debit_category = Category.find(receipt_params[:debit_budget]) unless receipt_params[:debit_budget].nil?
      credit_category = Category.find(receipt_params[:credit_budget]) unless receipt_params[:credit_budget].nil?

      if credit_users and receipt_params[:credit_users]
        users_str = receipt_params[:credit_users].to_s
        create_entry(users_str, main_category, -amount)
      end
      if debit_users and receipt_params[:debit_users]
        users_str = receipt_params[:debit_users].to_s
        create_entry(users_str, main_category, amount)
      end

      if credit_budget and !credit_category.nil?
        amount = -amount if %w'Konto Kasse'.include? credit_category.name
        create_entry(nil, credit_category, -amount)
      end
      if debit_budget and !debit_category.nil?
        amount = -amount if %w'Konto Kasse'.include? debit_category.name
        create_entry(nil, debit_category, amount)
      end
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
        :credit_radio,
        :debit_radio,
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