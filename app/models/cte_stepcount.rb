class CteStepcount < ApplicationRecord
  has_paper_trail

  belongs_to :cte_result_header
end