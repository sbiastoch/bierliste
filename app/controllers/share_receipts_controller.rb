class ShareReceiptsController < ReceiptsController
  def create
    @receipt = receipt_class.new(receipt_params)

    if @receipt.save
      redirect_to @receipt, notice: 'ShareReceipt was successfully created.'
    else
      render action: 'new'
    end
  end
end