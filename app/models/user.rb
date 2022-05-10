class User < ApplicationRecord
  has_one :profile
  has_one :user_setting

  has_many :departments
  has_many :reports
  has_many :feedbacks
end
