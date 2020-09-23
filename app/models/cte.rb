class Cte < ApplicationRecord
  has_paper_trail

  serialize :encryption_key, Array

  has_many :ctes_patients, dependent: :destroy
  has_many :patients, through: :ctes_patients

  has_many :cte_logs
  has_many :test_logs
end