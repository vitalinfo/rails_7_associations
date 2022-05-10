FactoryBot.define do
  factory :membership do
    company
    user { create(:user_simple) }
  end
end
