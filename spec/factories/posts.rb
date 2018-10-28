FactoryBot.define do
  factory :post do
    user
    date      { Time.zone.now }
    rationale { "Test rationale." }
  end
end
