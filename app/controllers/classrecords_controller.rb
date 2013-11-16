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
    @classrecord.students.each do |student|
      student.balance = student.balance - @classrecord.cost
      student.save
    end

    respond_to do |format|
      if @classrecord.save
        format.html { redirect_to @classrecord, notice: 'Classrecord was successfully created.' }
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
      params.require(:classrecord).permit(:cost,:student_ids=>[])
    end
end
