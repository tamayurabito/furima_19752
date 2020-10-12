class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  validates :item_name, :item_explanation, :item_category_id, :item_status_id, :delivery_charge_id, :delivery_area_id, :delivery_days_id, :price, :image, presence: true
  validates :item_category_id, :item_status_id, :delivery_charge_id, :delivery_area_id, :delivery_days_id, numericality: { other_than: 1 }
  validates :price, inclusion: {in: 300..9999999}
  belongs_to :user
  has_one_attached :image
  belongs_to_active_hash :item_category
  belongs_to_active_hash :item_status
  belongs_to_active_hash :delivery_charge
  belongs_to_active_hash :delivery_area
  belongs_to_active_hash :delivery_day
end
