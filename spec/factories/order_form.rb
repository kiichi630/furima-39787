FactoryBot.define do
  factory :order_form do
    item_id { FactoryBot.build(:item) }
    user_id { FactoryBot.build(:user) }
    post_code { Faker::Number.leading_zero_number(digits: 3) + '-' + Faker::Number.leading_zero_number(digits: 4) }
    area_id { Faker::Number.between(from: 2, to: 48) }
    municipalities { Faker::Address.city }
    street_address { Faker::Address.street_address }
    building_name { Faker::Company.name }
    telephone_number { Faker::Number.leading_zero_number(digits: 11) }
    token { "tok_abcdefghijk00000000000000000"}
  end
end