class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :assumed_name, null: false
      t.integer :assumed_selling_price, null: false
      t.integer :assumed_wholesale_price, null: false
      t.date :start_on, null: false
      t.string :period, null: false
      t.integer :volume, null: false
      t.text :purpose, null: false
      t.text :concept, null: false
      t.text :reference_image
      t.integer :status, null: false, default: 1
      t.references :client, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
