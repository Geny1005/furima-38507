FactoryBot.define do
  factory :user do
    nickname {'nickname'}
    last_name {'苗字'}
    last_name_kana {'カナ'}
    first_name {'名前'}
    first_name_kana {'カナ'}
    email {Faker::Internet.free_email}
    password {'Aa1111'}
    password_confirmation {'Aa1111'}
    birth_date {Faker::Date.backward}

  end
end