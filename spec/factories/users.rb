FactoryBot.define do
  factory :user do
    nickname              { 'xcvb' }
    email                 { 'xcvb@xcvb' }
    password              { 'xcvb1234' }
    password_confirmation { 'xcvb1234' }
    last_name             { '山田' }
    first_name            { '太郎' }
    last_name_hurigana    { 'ヤマダ' }
    first_name_hurigana   { 'タロウ' }
    birthday              { '1930-01-01' }
  end
end
