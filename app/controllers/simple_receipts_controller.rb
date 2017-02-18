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
              date: Date.new(receipt_params['date(1i)'].to_i,
                             receipt_params['date(2i)'].to_i,
                             receipt_params['date(3i)'].to_i),
              description: receipt_params[:description]
          )
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