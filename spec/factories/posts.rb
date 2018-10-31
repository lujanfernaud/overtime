# == Schema Information
#
# Table name: posts
#
#  id         :bigint(8)        not null, primary key
#  date       :date
#  rationale  :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint(8)
#  status     :integer          default("submitted")
#

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
