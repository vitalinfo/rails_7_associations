FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }

    after(:build) do |user|
      user.profile = build(:profile, user: user) if user.profile.blank?
      user.user_setting = build(:user_setting, user: user) if user.user_setting.blank?
    end
  end

  factory :user_simple, parent: :user, class: 'User::Simple' do
  end
end
