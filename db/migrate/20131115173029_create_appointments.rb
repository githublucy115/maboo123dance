class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.references :student_id
      t.references :classrecord_id

      t.timestamps
    end
  end
end
