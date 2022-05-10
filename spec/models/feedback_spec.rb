require 'rails_helper'

RSpec.describe Feedback, type: :model do
  subject { build(:feedback) }

  it { is_expected.to be_valid }
end
