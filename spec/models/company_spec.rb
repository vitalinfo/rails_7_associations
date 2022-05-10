require 'rails_helper'

RSpec.describe Company, type: :model do
  subject { build(:company) }

  it { is_expected.to be_valid }

  describe 'when preloads' do
    subject { described_class.all.preload(:profiles, :user_settings, :reports, :feedbacks) }

    let(:company) { create :company }
    let(:count) { Faker::Number.non_zero_digit }

    before do
      create_list :department, count, company: company

      company.users.each do |user|
        create_list :report, count, user: user
        create_list :feedback, count, user: user
      end
    end

    it do
      expect(subject.map(&:profiles).flatten.size).to eq(count)
      expect(subject.map(&:user_settings).flatten.size).to eq(count)
      expect(subject.map(&:reports).flatten.size).to eq(count * count)
      expect(subject.map(&:feedbacks).flatten.size).to eq(count * count)
    end
  end
end
