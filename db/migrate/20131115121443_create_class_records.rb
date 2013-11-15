class CreateClassRecords < ActiveRecord::Migration
  def change
    create_table :class_records do |t|
      t.decimal :cost
      t.datetime :date

      t.timestamps
    end
  end
end
