class CreateNegotiations < ActiveRecord::Migration[6.1]
  def change
    create_table :negotiations do |t|
      t.date :negotiate_at, null: false
      t.string :name, null: false
      t.integer :selling_price, null: false
      t.integer :wholesale_price, null: false
      t.text :product_image
      t.text :explanation, null: false
      t.references :user, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
