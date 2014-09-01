class ReceiptsController < ApplicationController
  before_action :set_receipt, only: [:show, :edit, :update, :destroy]

  # GET /receipts
  # GET /receipts.json
  def index
    @receipts = receipt_class.all
  end

  # GET /receipts/1
  # GET /receipts/1.json
  def show
  end

  # GET /receipts/new
  def new
    @receipt = receipt_class.new
  end

  # GET /receipts/1/edit
  def edit
  end

  # POST /receipts
  # POST /receipts.json
  def create
    @receipt = receipt_class.new(receipt_params)

    if @receipt.save
      redirect_to @receipt, notice: 'Receipt was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /receipts/1
  # PATCH/PUT /receipts/1.json
  def update
    respond_to do |format|
      if @receipt.update(receipt_params)
        format.html { redirect_to @receipt, notice: 'Receipt was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @receipt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /receipts/1
  # DELETE /receipts/1.json
  def destroy
    @receipt.destroy
    respond_to do |format|
      format.html { redirect_to receipts_url }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_receipt
      @receipt = Receipt.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def receipt_params
      if params[:type] == 'SimpleReceipt'
        params.require(:SimpleReceipt).permit(:category_id, :description, :date, :type, :amount, :users, :semester_id)
      elsif params[:type] == 'ShareReceipt'
        params.require(:ShareReceipt).permit(:category_id, :description, :date, :type, :amount, :users, :semester_id)
      else
        params.require(:recept).permit(:category_id, :description, :date, :type, :amount, :users, :semester_id)
      end
    end

    def receipt_class
      if defined? type
        type.constantize
      elsif params[:type]
        params[:type].constantize
      else
        'Receipt'.constantize
      end
    end
end
