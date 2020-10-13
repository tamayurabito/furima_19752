FactoryBot.define do
  factory :item do
    association :user
    item_name             { '商品名' }
    item_explanation      { '商品説明文' }
    item_category_id      { 2 }
    item_status_id        { 2 }
    delivery_charge_id    { 2 }
    delivery_area_id      { 2 }
    delivery_days_id      { 2 }
    price                 { 300 }
  end
end
