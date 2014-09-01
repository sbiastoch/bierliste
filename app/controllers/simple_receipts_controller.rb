class SimpleReceiptsController < ReceiptsController
  def create

    Receipt.transaction do
      begin
        @receipt = receipt_class.new(receipt_params)
        @receipt.semester = Semester.current
        @receipt.save!

        receipt_params[:users].to_s.split(',').each do |user|
          the_user = User.where(name: user.strip).first

          Entry.create!(
              receipt: @receipt,
              user: the_user,
              amount: receipt_params[:amount],
              date: receipt_params[:date],
              description: receipt_params[:description]
          )
          the_user.update_attribute(:balance, the_user.balance.to_f - receipt_params[:amount].to_f)
        end
      rescue => e
        flash[:errors] = 'Fehler'
        render action: 'new'
      else
        redirect_to @receipt, notice: 'SimpleReceipt was successfully created.'
      end
    end

  end
end