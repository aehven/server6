class CtesPatient < ApplicationRecord
  has_paper_trail

  belongs_to :cte
  belongs_to :patient
end