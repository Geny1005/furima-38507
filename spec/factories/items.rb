FactoryBot.define do
  factory :item do
    
    name {'商品名'}
    information {'商品情報'}
    category_id {'2'}
    condition_id {'2'}
    delivery_burden_id {'2'}
    sender_area_id {'2'}
    schedule_id {'2'}
    price {'300'}

    image {Faker::Lorem.sentence}
    association :user 

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    
  end
end
