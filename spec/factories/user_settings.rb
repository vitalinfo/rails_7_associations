FactoryBot.define do
  factory :user_setting do
    user { create(:user_simple) }
  end
end
