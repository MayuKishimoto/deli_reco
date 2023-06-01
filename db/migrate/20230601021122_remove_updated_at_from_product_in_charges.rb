class RemoveUpdatedAtFromProductInCharges < ActiveRecord::Migration[6.1]
  def up
    remove_column :product_in_charges, :updated_at
  end

  def down
    add_column :product_in_charges, :updated_at, :datetime
  end
end
