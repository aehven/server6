class CteData < ApplicationRecord
  has_paper_trail

  belongs_to :cte

  has_many :cte_result_headers # we only *ever* want the last of these 

  def cte_result_header 
    cte_result_headers.last
  end
end