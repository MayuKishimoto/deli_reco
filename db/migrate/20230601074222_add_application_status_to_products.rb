class AddApplicationStatusToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :application_status, :integer, null: false, default: 1
  end
end
