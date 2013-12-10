class PaymentsController < ApplicationController
  # POST /expenses
  def create
    @payment = Payment.new(payment_params)
    respond_to do |format|
      if @payment.save
        student = @payment.expense.student
        student.balance += @payment.amount
        student.save! 
        format.html { redirect_to @payment.expense, notice: 'Payment was successfully created.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_expense
      @expense = Payment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def payment_params
      params.require(:payment).permit(:expense_id, :payment_method, :amount)
    end
end
