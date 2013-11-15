class CreateStudentsClassrecords < ActiveRecord::Migration
  def change
    create_table :students_classrecords do |t|
    	t.belongs_to :student
    	t.belongs_to :classrecord
    end
  end
end
