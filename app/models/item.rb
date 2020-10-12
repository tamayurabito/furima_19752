class Item < ApplicationRecord
  validates :item_name, :item_explanation, :item_status, :delivery_charge_id, :delivery_area_id, :delivery_days_id, :price, presence: true
  validates :item_name, :item_explanation, :item_category_id, :item_status_id, :delivery_charge_id, :delivery_area_id, :delivery_days_id, :price, :image, presence: true
  validates :price, inclusion: {in: 300..9999999}
  belongs_to :user
end
