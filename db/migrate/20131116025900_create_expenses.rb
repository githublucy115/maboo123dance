class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.integer :student_id
      t.integer :classorder_id
      t.decimal :amount

      t.timestamps
    end
  end
end
