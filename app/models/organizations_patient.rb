class OrganizationsPatient < ApplicationRecord
  belongs_to :organization
  belongs_to :patient
end
