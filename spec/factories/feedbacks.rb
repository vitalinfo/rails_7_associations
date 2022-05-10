FactoryBot.define do
  factory :feedback do
    user
    message { Faker::Lorem.sentence }
  end
end
