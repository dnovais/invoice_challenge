class CreateInvoices < ActiveRecord::Migration[6.1]
  def change
    create_table :invoices do |t|
      t.references :company, null: false, foreign_key: true
      t.references :client, null: false, foreign_key: true
      t.string :title
      t.string :status
      t.text :description
      t.decimal :discount_percentage
      t.decimal :discount_amount
      t.decimal :tax_percentage
      t.decimal :tax_amount
      t.date :due_date
      t.decimal :sub_total
      t.decimal :total

      t.timestamps
    end
  end
end
