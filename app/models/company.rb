class Company < ApplicationRecord
  has_many :departments, inverse_of: :company, dependent: :destroy
  has_many :users, through: :departments

  has_many :profiles, through: :users
  has_many :user_settings, through: :users
  has_many :reports, through: :users
  has_many :feedbacks, through: :users
end
