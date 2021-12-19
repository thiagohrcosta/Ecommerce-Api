FactoryBot.define do
  factory :game do
    mode { %i(pvp pve both).sample }
    release_date { "2021-12-19 11:04:25" }
    developer { Faker::Company.name }
    system_requirement
  end
end
