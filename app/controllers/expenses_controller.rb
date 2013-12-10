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
