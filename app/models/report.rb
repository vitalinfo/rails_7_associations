class Report < ApplicationRecord
  belongs_to :user, inverse_of: :reports, class_name: 'User::Simple'
end
