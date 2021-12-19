FactoryBot.define do
  factory :coupon do
    code { Faker::Commerce.unique.promotion_code(digits: 6) }
    status { %i(active inactive).samble }
    discount_value { rand(1..99) }
    due_date { "2021-12-19 11:48:52" }
  end
end
