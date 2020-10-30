class Patient < ApplicationRecord
  has_paper_trail

  #TODO organization relation might conflict with user relation, so probably should go.
  belongs_to :organization
  
  has_many :patients_users, dependent: :destroy
  has_many :users, through: :patients_users

  has_many :patients_test_plans, dependent: :destroy
  has_many :test_plans, through: :patients_test_plans

  has_many :ctes_patients, dependent: :destroy
  has_many :ctes, through: :ctes_patients

  has_many :surgeries
  
  scope :search, -> term {where("patients.first_name LIKE ? OR patients.last_name LIKE ? or patients.phone LIKE ?", "%#{term}%", "%#{term}%", "%#{term}%")}

  def doctors
    users.Doctor
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def last_n_results(n=15)
    dsns = patients_test_plans.map(&:test_results).flatten.map(&:dataset_number)
    data = CteData.where(dataset_number: dsns, cte_id: ctes.first.id)
    data.last(n).collect{|d| d.cte_result_header&.cte_result_averages}.compact.select{|r| r[:qualified_gait_cycle] > 0}
  end
end
