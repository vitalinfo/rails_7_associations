require 'rails_helper'

RSpec.describe User, type: :model do
  subject { build(:user_simple) }

  it { is_expected.to be_valid }
end
