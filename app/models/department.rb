class Department < ApplicationRecord
  belongs_to :company, inverse_of: :departments
  belongs_to :user, autosave: true, inverse_of: :departments
end
