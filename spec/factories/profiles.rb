FactoryBot.define do
  factory :profile do
    user { create(:user_simple) }
    name { Faker::Name.name }
  end
end
