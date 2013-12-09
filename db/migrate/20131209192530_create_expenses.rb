class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.references :student, index: true
      t.integer :classrecord_id
      t.decimal :amount

      t.timestamps
    end
  end
end
