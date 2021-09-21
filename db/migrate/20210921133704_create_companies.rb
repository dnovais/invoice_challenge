class CreateCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :email
      t.string :cnpj
      t.text :address
      t.string :phone

      t.timestamps
    end
    add_index :companies, :email, unique: true
    add_index :companies, :cnpj, unique: true
  end
end
