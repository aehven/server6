class Surgery < ApplicationRecord
  has_paper_trail

  belongs_to :patient
end