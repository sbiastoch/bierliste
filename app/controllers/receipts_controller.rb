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


  def format_user_str(str)
    users = str.to_s.split(',')
    users = users.map { |i|
      s = i.split('*')
      if s.size == 1
        [s[0].strip => 1.0]
      else
        if s[0].to_s.strip =~ /^(\d+|\d+[\.,]\d+)$/ # multiplikator steht vorne
          [s[1].strip => s[0].to_f]
        else
          [s[0].strip => s[1].to_f]
        end
      end
    }
    users.flatten
  end

  def create_entry(users_str, category, amount)
    if users_str
      the_users = format_user_str(users_str)
      total = the_users.flat_map(&:values).reduce(:+).to_f
      unit = amount / total

      the_users.each do |name|
        the_user = User.where(name: name.keys[0]).first
        if the_user.nil?
          flash[:error] = 'Nutzer '+name.keys[0] + ' nicht gefunden!'
      #    redirect_to ('new_'+@type.constantize+'_path').constantize
        else
          factor = name.values[0]
          new_entry category, the_user, factor * unit, factor
        end
      end
    else
      new_entry category, nil, amount, 1 # for budget entry
    end
  end

  def new_entry(category, user, amount, factor)

    Entry.create!(
        semester: Semester.current,
        category: category,
        receipt: @receipt,
        user: user,
        amount: amount,
        date: Date.new(receipt_params['date(1i)'].to_i,
                       receipt_params['date(2i)'].to_i,
                       receipt_params['date(3i)'].to_i),
        description: receipt_params[:description]+
            (factor != 1 ?
             ' · (' + (factor.to_f.eql?(factor.to_i.to_f) ? factor.to_i.to_s : factor.to_f.to_s) +'x)'
            : '')
    )
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_receipt
    @receipt = Receipt.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def receipt_params
    params.require(:ShareReceipt).permit(
        :category_id,
        :description,
        :date,
        :type,
        :amount,
        :credit_users,
        :credit_budget,
        :debit_budget,
        :debit_users,
        :credit_radio,
        :debit_radio,
        :semester_id
    )
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
