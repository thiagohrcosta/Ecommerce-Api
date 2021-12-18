FactoryBot.define do
  factory :system_requirement do
    sequence(:name) { |n| "Basic #{n}" }
    operational_system { Faker::Computer.os}
    storage { "50GB" }
    processor { "AMD Ryzen 7" }
    memory { "8GB" }
    video_board { "GeForce X" }
  end
end
