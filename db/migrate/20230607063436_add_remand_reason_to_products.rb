class AddRemandReasonToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :remand_reason, :text
  end
end
