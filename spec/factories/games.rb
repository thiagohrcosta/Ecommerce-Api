FactoryBot.define do
  factory :game do
    mode { 1 }
    release_date { "2021-12-19 11:04:25" }
    developer { "MyString" }
    system_requirement { nil }
  end
end
