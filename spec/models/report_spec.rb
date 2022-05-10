require 'rails_helper'

RSpec.describe Report, type: :model do
  subject { build(:report) }

  it { is_expected.to be_valid }
end
