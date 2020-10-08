class Item < ApplicationRecord
  validates :item_name, :item_explanation, :item_status, :delivery_charge_id, :delivery_area_id, :delivery_days_id, :price, presence: true
  belongs_to :user
end
