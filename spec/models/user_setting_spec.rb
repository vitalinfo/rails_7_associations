require 'rails_helper'

RSpec.describe UserSetting, type: :model do
  subject { build(:user_setting) }

  it { is_expected.to be_valid }
end
