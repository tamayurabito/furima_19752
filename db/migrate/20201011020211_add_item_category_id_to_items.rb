class AddItemCategoryIdToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :item_category_id, :integer, null: false
  end
end
