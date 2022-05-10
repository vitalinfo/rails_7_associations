class Report < ApplicationRecord
  belongs_to :user, inverse_of: :reports
end
