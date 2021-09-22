class CreatePayments < ActiveRecord::Migration[6.1]
  def change
    create_table :payments do |t|
      t.references :invoice, null: false, foreign_key: true
      t.decimal :amount, :precision => 8, :scale => 2
      t.integer :payment_kind, default: 0
      t.date :payment_date
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
