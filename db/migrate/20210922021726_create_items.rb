class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.decimal :unit_cost
      t.integer :quantity

      t.timestamps
    end
  end
end
