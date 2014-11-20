class DrinkReceiptsController < ReceiptsController

  def new
    @receipt = DrinkReceipt.new
    User.all_for_lists.each do |user|
      e = Entry.new
      e.user = user
      e.date =  Time.now
      e.category = Category.where(name: 'Getränke', semester: Semester.current).first
      e.semester = Semester.current
      @receipt.entries << e
    end
  end

  def create
    @receipt = receipt_class.new(receipt_params)
      #begin
        @receipt.semester_id = Semester.current.id
        @receipt.category_id = Category.where(name: 'Getränke', semester: Semester.current).first.id
        @receipt.description = 'Getränkeabrechnung '+Semester.current.semester_name
        @receipt.date = Time.now
        @receipt.amount = receipt_params[:entries_attributes].flatten.map { |entry| entry['amount'].to_s.to_i }.reduce(:+)
        @receipt.save!
        @receipt.entries.each { |e| e.receipt_id = @receipt.id }

      #rescue => e
       # flash[:error] = 'Fehler: '+e.message
       # puts e.backtrace
       # render action: 'new'
      #else
        redirect_to @receipt, notice: 'DrinkReceipt was successfully created.'
      #end
    end


  def receipt_params
    params.require(:DrinkReceipt).permit(
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
        :semester_id,
        :entries_attributes => [:amount, :description, :user_id, :receipt_id, :category_id, :semester_id, :date]
    )
  end
end