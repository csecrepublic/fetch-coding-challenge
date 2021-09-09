class PayerTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :payer_transactions do |t|
      t.string :payer
      t.integer :points
      t.datetime :timestamp
   end
  end
end
