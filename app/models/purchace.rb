class Purchace < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :item
  has_one :address
  belongs_to_active_hash :delivery_area
end
