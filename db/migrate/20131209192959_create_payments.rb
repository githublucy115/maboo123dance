class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.references :expense, index: true
      t.decimal :amount
      t.string :payment_method

      t.timestamps
    end
  end
end
