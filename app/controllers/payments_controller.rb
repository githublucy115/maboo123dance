class PaymentsController < ApplicationController
  # POST /expenses
  def create
    @payment = Payment.new(payment_params)
    respond_to do |format|
      student = @payment.expense.student
      if @payment.payment_method == 'dancecredit' or @payment.payment_method == 'guest'
        student.balance += @payment.expense.amount if @payment.payment_method == 'dancecredit'
        @payment.amount = @payment.expense.amount - @payment.expense.paid
        student.credit -= 1 if @payment.payment_method == 'dancecredit'
      end
      if @payment.payment_method == 'undo'
        expense = @payment.expense
        if expense.classrecord_id < 0
          student.credit += expense.classrecord_id
          student.balance += expense.amount
          student.save!
          expense.destroy
          format.html { redirect_to student, notice: 'Expense was successfully deleted.' }
          format.json { head :no_content }
        else
          format.html { redirect_to @payment.expense, notice: 'Expense was successfully deleted.' }
          format.json { head :no_content }
        end
      elsif @payment.save
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
