FactoryBot.define do
  factory :category do
    sequence(:name) { |n| "Action #{n}" }
  end
end
