FactoryBot.define do
  factory :user do
    sequence(:first_name) { |n| "Factory #{n}" }
    sequence(:last_name)  { |n| "User #{n}" }
    sequence(:email)      { |n| "factoryuser#{n}@test.test" }
    password              { "password" }
    password_confirmation { "password" }
  end
end
