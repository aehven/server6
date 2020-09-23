class TestLog < ApplicationRecord
  has_paper_trail

  belongs_to :cte
end