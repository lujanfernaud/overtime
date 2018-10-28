FactoryBot.define do
  factory :post do
    date      { Time.zone.now }
    rationale { "Test rationale." }
  end
end
