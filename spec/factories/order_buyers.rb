FactoryBot.define do
  factory :order_buyer do
    postal_code { '123-4567' }
    prefecture_id { 2 }
    municipality { "横浜市" }
    address { "1-1" }
    building_name { "横浜ビル" }
    phone_number { "09012345678" }
    token { "tok_abcdefghijk00000000000000000" }
    association :item
    association :user
  end
end