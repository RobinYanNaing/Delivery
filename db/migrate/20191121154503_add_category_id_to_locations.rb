class AddCategoryIdToLocations < ActiveRecord::Migration[5.2]
  def change
    add_column :locations, :category_id, :integer
  end
end
