FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }

    after(:build) do |user|
      user.profile = build(:profile, user: user) if user.profile.blank?
      user.user_setting = build(:user_setting, user: user) if user.user_setting.blank?
    end
  end
end
