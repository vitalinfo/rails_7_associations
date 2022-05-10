class User < ApplicationRecord
  has_one :profile, inverse_of: :user, dependent: :destroy
  has_one :user_setting, inverse_of: :user, dependent: :destroy

  has_many :departments, inverse_of: :user, dependent: :destroy
  has_many :reports, inverse_of: :user, dependent: :destroy
  has_many :feedbacks, inverse_of: :user, dependent: :destroy
end
