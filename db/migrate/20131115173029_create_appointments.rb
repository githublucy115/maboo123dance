class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.references :student
      t.references :classrecord

      t.timestamps
    end
  end
end
