FactoryBot.define do
  factory :report do
    user { create(:user_simple) }
    name { Faker::Company.name }
  end
end
