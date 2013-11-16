class CreateClassrecords < ActiveRecord::Migration
  def change
    create_table :classrecords do |t|
      t.decimal :cost
      t.string :location

      t.timestamps
    end
  end
end
