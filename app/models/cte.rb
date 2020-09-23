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
end