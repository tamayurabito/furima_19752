FactoryBot.define do
  factory :purchace_address do
    # association :user
    # association :item
    postal_code           { '123-4567' }
    delivery_area_id      { 2 }
    citys                 { '横浜市緑区' }
    addresses             { '青山1-1-1' }
    phone_number          { '09012345678' }
  end
end
