class Patient < ApplicationRecord
  has_paper_trail

  #TODO organization relation might conflict with user relation, so probably should go.
  has_many :organizations_patients, dependent: :destroy
  has_many :organizations, through: :organizations_patients

  has_many :patients_users, dependent: :destroy
  has_many :users, through: :patients_users

  def doctors
    users.Doctor
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
