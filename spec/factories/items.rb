FactoryBot.define do
  factory :item do
    name {"商品名"}
    description {"説明文"}
    category_id {2}
    status_id {2}
    charge_burden_id {2}
    prefecture_id {2}
    price {3000}
    day_id {2}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/test_image.png'), filename: 'test_image.png')
    end
  end
end
