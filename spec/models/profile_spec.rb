require 'rails_helper'

RSpec.describe Profile, type: :model do
  subject { build(:profile) }

  it { is_expected.to be_valid }
end
