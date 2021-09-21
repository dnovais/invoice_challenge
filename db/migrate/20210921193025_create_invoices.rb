class CreateInvoices < ActiveRecord::Migration[6.1]
  def change
    create_table :invoices do |t|
      t.references :company, null: false, foreign_key: true
      t.references :client, null: false, foreign_key: true
      t.string :title
      t.integer :status, default: 0
      t.text :description
      t.decimal :discount_percentage
      t.decimal :discount_amount, :precision => 8, :scale => 2
      t.decimal :tax_percentage
      t.decimal :tax_amount, :precision => 8, :scale => 2
      t.date :due_date
      t.decimal :sub_total, :precision => 8, :scale => 2
      t.decimal :total, :precision => 8, :scale => 2

      t.timestamps
    end
  end
end
