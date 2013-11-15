class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.belongs_to :student_id
      t.belongs_to :classrecord_id

      t.timestamps
    end
  end
end
