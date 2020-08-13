class Organization < ApplicationRecord
  has_paper_trail skip: [:updated_at, :created_at]

  acts_as_nested_set

  enum kind: [
    :hospital,
    :clinic,
    :pt
  ]
  
  has_many :organizations_users, dependent: :destroy
  has_many :users, through: :organizations_users
  
  def self.search(search)
    columns = %w{
      name
      address1
      address2
      phone1
      phone2
      phone3
      email1
      email2
      email3
      city
      country
      zip
    }

    conditions = []
    search.split(" ").each do |term|
      conditions << columns.map{|p| "#{p} like '%#{term}%'"}.join(' OR ')
    end

    where(conditions.join(' OR '))
  end

  def to_s
    [name, city].compact.join(", ")
  end

  def name_with_ancestors
    self_and_ancestors.map(&:name).join(" / ")
  end

  def patients
    #FIXME probably overkill.  Can we say that a patient can only belong to a root organization?
    #see user#patients.
    organization_ids = self_and_descendants.map(&:id)
    Patient.where(organization_id: [organization_ids])
  end
end
