class CreateClients < ActiveRecord::Migration[6.1]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :email
      t.string :cpf
      t.text :address
      t.string :phone

      t.timestamps
    end
    add_index :clients, :email, unique: true
    add_index :clients, :cpf, unique: true
  end
end
