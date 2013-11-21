class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show, :edit, :update, :destroy]

  # GET /transactions
  # GET /transactions.json
  def index
    @transactions = Transaction.all.sort {|p,e|
        a = "created_at"
        p.send(a) <=> e.send(a)
    }.reverse
  end

  def student
    @student = Student.find(params[:id])
    @transactions = Transaction.where("student_id = '#{params[:id]}'").sort {|p,e|
        a = "created_at"
        p.send(a) <=> e.send(a)
    }.reverse
  end

  def classrecord
    @classrecord = Classrecord.find(params[:id])
    @transactions = Transaction.where("classrecord_id = '#{params[:id]}'").sort {|p,e|
      a = "created_at"
      p.send(a) <=> e.send(a)
    }.reverse
  end

  # GET /transactions/1
  # GET /transactions/1.json
  def show
  end

  # GET /transactions/new
  def new
    @transaction = Transaction.new
  end

  # GET /transactions/1/edit
  def edit
  end

  # POST /transactions
  # POST /transactions.json
  def create
    @transaction = Transaction.new(transaction_params)
    @student = Student.find(@transaction.student_id)
    if @transaction.payment_method == "credit"
      @student.credit += @transaction.amount
    elsif @transaction.payment_method == ("cash" || "credit")
      @student.balance += @transaction.amount
    end
    @student.save!

    respond_to do |format|
      if @transaction.save
        format.html { redirect_to transactions_student_path(@student), notice: 'Transaction was successfully created.' }
        format.json { render action: 'show', status: :created, location: @transaction }
      else
        format.html { render action: 'new' }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transactions/1
  # PATCH/PUT /transactions/1.json
  def update
    respond_to do |format|
      if @transaction.update(transaction_params)
        format.html { redirect_to @transaction, notice: 'Transaction was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1
  # DELETE /transactions/1.json
  def destroy
    @transaction.destroy
    respond_to do |format|
      format.html { redirect_to transactions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transaction_params
      params.require(:transaction).permit(:student_id, :classrecord_id, :amount, :credit,:payment_method)
    end
end
