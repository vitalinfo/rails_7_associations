FactoryBot.define do
  factory :feedback do
    user { create(:user_simple) }
    message { Faker::Lorem.sentence }
  end
end
