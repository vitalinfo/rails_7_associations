class Feedback < ApplicationRecord
  belongs_to :user, inverse_of: :feedbacks
end
