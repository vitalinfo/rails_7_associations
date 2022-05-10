FactoryBot.define do
  factory :report do
    user
    name { Faker::Company.name }
  end
end
