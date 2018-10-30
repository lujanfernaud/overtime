FactoryBot.define do
  factory :post do
    user
    date      { Time.zone.now }
    rationale { "Test rationale." }
    status    { "submitted" }

    trait :approved do
      status { "approved" }
    end

    trait :rejected do
      status { "rejected" }
    end
  end
end
