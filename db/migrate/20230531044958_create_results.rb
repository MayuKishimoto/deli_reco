class CreateResults < ActiveRecord::Migration[6.1]
  def change
    create_table :results do |t|
      t.text :content, null: false
      t.text :reference_image
      t.references :user, null: false, foreign_key: true
      t.references :negotiation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
