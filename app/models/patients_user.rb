class PatientsUser < ApplicationRecord
  belongs_to :patient
  belongs_to :user
end
