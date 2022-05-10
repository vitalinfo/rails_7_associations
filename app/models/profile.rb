class Profile < ApplicationRecord
  belongs_to :user, inverse_of: :profile, class_name: 'User::Simple'
end
