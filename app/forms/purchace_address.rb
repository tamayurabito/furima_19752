class PurchaceAddress
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postal_code, :delivery_area_id, :citys, :addresses, :building_name, :phone_number, :purchace_id

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :delivery_area_id, numericality: { other_than: 1 }
    validates :citys, :addresses
    validates :phone_number, length: { maximum: 11 }, format: { with: /\A[0-9]+\z/ }
  end

  def save
    purchace = Purchace.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, delivery_area_id: delivery_area_id, citys: citys, addresses: addresses, building_name: building_name, phone_number: phone_number, purchace_id: purchace.id)
  end
end
