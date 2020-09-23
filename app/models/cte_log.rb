class CteLog < ApplicationRecord
  has_paper_trail

  belongs_to :cte
end