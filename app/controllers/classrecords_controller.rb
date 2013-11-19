class ClassrecordsController < ApplicationController
  before_action :set_classrecord, only: [:show, :edit, :update, :destroy]

  # GET /classrecords
  # GET /classrecords.json
  def index
    @classrecords = Classrecord.all
  end

  # GET /classrecords/1
  # GET /classrecords/1.json
  def show

  end

  # GET /classrecords/new
  def new
    @classrecord = Classrecord.new
  end

  # GET /classrecords/1/edit
  def edit
  end

  # POST /classrecords
  # POST /classrecords.json
  def create
    @classrecord = Classrecord.new(classrecord_params)
    gb = Gibbon::API.new('a8a38b57426df6a6713f88035305f442-us3')
    gb_list = []
    count = 0

    respond_to do |format|
      if @classrecord.save
        @classrecord.reload.students.each do |student|
          count += 1
          method = student.credit > 0 ? :credit : :cash
          amount = method == :credit ? -1 : 0 - @classrecord.cost
          t = Transaction.create(
            :student_id=>student.id,
            :classrecord_id=>@classrecord.id,
            :amount=>amount,
            :payment_method=>method
            )
          student.balance += t.amount if method == :cash
          student.credit += t.credit if method == :credit
          #gb_list << {:EMAIL=>{:email=>student.email},:FNAME=>student.firstname,:LNAME=>student.lastname}
          student.save
        end
        #gb.lists.batch_subscribe(:id=>"0c97387b34",:batch=>gb_list)
        format.html { redirect_to transactions_classrecord_path(@classrecord), notice: 'Classrecord was successfully created.' }
        format.json { render action: 'show', status: :created, location: @classrecord }
      else
        format.html { render action: 'new' }
        format.json { render json: @classrecord.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /classrecords/1
  # PATCH/PUT /classrecords/1.json
  def update
    respond_to do |format|
      if @classrecord.update(classrecord_params)
        @classrecord.reload.students.each do |student|
          unless Appointment.find_by(student_id: student.id, classrecord_id: @classrecord.id).exists?
            count += 1
            method = student.credit > 0 ? :credit : :cash
            amount = method == :credit ? -1 : 0 - @classrecord.cost
            t = Transaction.create(
              :student_id=>student.id,
              :classrecord_id=>@classrecord.id,
              :amount=>amount,
              :payment_method=>method
              )
            student.balance += t.amount if method == :cash
            student.credit += t.credit if method == :credit
            #gb_list << {:EMAIL=>{:email=>student.email},:FNAME=>student.firstname,:LNAME=>student.lastname}
            student.save
          end
        end

        format.html { redirect_to @classrecord, notice: 'Classrecord was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @classrecord.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /classrecords/1
  # DELETE /classrecords/1.json
  def destroy
    @classrecord.destroy
    respond_to do |format|
      format.html { redirect_to classrecords_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_classrecord
      @classrecord = Classrecord.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def classrecord_params
      params.require(:classrecord).permit(:cost,:location,:student_ids=>[])
    end
end
