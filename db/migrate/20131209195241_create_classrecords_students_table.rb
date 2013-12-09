class CreateClassrecordsStudentsTable < ActiveRecord::Migration
  def change
	create_table :classrecords_students do |t|
      t.references :classrecord, index: true
      t.references :student, index: true
    end
  end
end