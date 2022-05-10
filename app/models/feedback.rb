class Feedback < ApplicationRecord
  belongs_to :user, inverse_of: :feedbacks, class_name: 'User::Simple'
end
