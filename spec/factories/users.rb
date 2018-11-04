# == Schema Information
#
# Table name: users
#
#  id                     :bigint(8)        not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  first_name             :string
#  last_name              :string
#  type                   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

FactoryBot.define do
  factory :user do
    sequence(:first_name) { |n| "Factory #{n}" }
    sequence(:last_name)  { |n| "User #{n}" }
    sequence(:email)      { |n| "factoryuser#{n}@test.test" }
    password              { "password" }
    password_confirmation { "password" }
    phone                 { "1234567890" }

    trait :admin do
      type { "AdminUser" }
    end
  end
end
