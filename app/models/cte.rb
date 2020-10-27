class Cte < ApplicationRecord
  has_paper_trail

  serialize :encryption_key, Array

  has_many :ctes_patients, dependent: :destroy
  has_many :patients, through: :ctes_patients

  has_many :cte_logs
  has_many :cte_dexes
  has_many :cte_datas
  
  def last_dataset_number
    cte_datas.last&.dataset_number || 0
  end

  def last_n_results(n=15)
    #FIXME these actually should be grouped into walking/lunges/stairs 
    cte_datas.last(n).collect{|d| d.cte_result_header&.cte_result_averages}.compact
  end
end