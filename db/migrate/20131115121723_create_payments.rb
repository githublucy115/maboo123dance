class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :student_id
      t.decimal :amount
      t.decimal :previous

      t.timestamps
    end
  end
end
