class RemoveUpdatedAtFromAffiliations < ActiveRecord::Migration[6.1]
  def up
    remove_column :affiliations, :updated_at
  end

  def down
    add_column :affiliations, :updated_at, :datetime
  end
end
