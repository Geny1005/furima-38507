FactoryBot.define do
  factory :order_address do

    postal_code { '123-4567' }
    sender_area_id { '2' }
    city { '大阪市' }
    address { '1-1' }
    phone_number { '09012345678' }
    building { 'フリマビル' }

  end
end
