class Patient < ApplicationRecord
  has_paper_trail

  #TODO organization relation might conflict with user relation, so probably should go.
  belongs_to :organization
  
  has_many :patients_users, dependent: :destroy
  has_many :users, through: :patients_users

  scope :search, -> term {where("patients.first_name LIKE ? OR patients.last_name LIKE ? or patients.phone LIKE ?", "%#{term}%", "%#{term}%", "%#{term}%")}

  def doctors
    users.Doctor
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
