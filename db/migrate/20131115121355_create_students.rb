class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.string :email
      t.decimal :balance
      t.integer :credit

      t.timestamps
    end
  end
end
