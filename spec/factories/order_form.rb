FactoryBot.define do
  factory :order_form do
    item_id { Faker::Number.non_zero_digit }
    user_id { Faker::Number.non_zero_digit }
    post_code { Faker::Number.leading_zero_number(digits: 3) + '-' + Faker::Number.leading_zero_number(digits: 4) }
    area_id { Faker::Number.between(from: 2, to: 48) }
    municipalities { Faker::Address.city }
    street_address { Faker::Address.street_address }
    building_name { Faker::Company.name }
    telephone_number { Faker::Number.leading_zero_number(digits: 11) }
  end
end