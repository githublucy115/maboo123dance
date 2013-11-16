class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.references :appointment
      t.string :payment_method
      t.decimal :amount
      t.decimal :previous

      t.timestamps
    end
  end
end
