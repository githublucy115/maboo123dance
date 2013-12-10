class ExpensesController < ApplicationController
  before_action :set_expense, only: [:show, :edit, :update, :destroy]

  # GET /expenses
  # GET /expenses.json
  def index
    @expenses = Expense.all.sort {|p,e|
        a = "created_at"
        p.send(a) <=> e.send(a)
    }.reverse
  end

  def student
    @student = Student.find(params[:id])
    @expenses = Expense.where("student_id = '#{params[:id]}'").sort {|p,e|
        a = "created_at"
        p.send(a) <=> e.send(a)
    }.reverse
  end

  def classrecord
    @classrecord = Classrecord.find(params[:id])
    @expenses = Expense.where("classrecord_id = '#{params[:id]}'").sort {|p,e|
      a = "created_at"
      p.send(a) <=> e.send(a)
    }.reverse
  end

  # POST /expenses
  def create
    @expense = Expense.new(expense_params)
    if @expense.classrecord_id < 0
      student = @expense.student
      student.credit -= @expense.classrecord_id
      student.expenses.each do |expense|
        if expense.paid == 0 && expense.classrecord_id > 0
          Payment.create(
            :expense_id => expense.id,
            :amount => expense.amount,
            :payment_method => :dancecredit
          )
          student.credit -= 1
        end
      end
      student.save!
    end
    respond_to do |format|
      if @expense.save
        format.html { redirect_to @expense.student, notice: 'Credit was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /expenses/1
  # GET /expenses/1.json
  def show
  end

  # GET /expenses/new
  def new
    @expense = Expense.new
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_expense
      @expense = Expense.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def expense_params
      params.require(:expense).permit(:student_id, :classrecord_id, :amount)
    end
end
