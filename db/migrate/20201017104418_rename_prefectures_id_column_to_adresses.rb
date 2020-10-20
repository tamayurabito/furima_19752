class RenamePrefecturesIdColumnToAdresses < ActiveRecord::Migration[6.0]
  def change
    rename_column :addresses, :prefectures_id, :delivery_area_id
  end
end
