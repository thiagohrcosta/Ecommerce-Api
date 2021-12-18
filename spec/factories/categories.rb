FactoryBot.define do
  factory :category do
    sequence(:name) { |n| "Metal Gear Solid #{n}" }
  end
end
