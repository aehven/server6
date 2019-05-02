class Customer < ApplicationRecord
  has_paper_trail skip: [:updated_at, :created_at]

  # acts_as_nested_set

  has_many :users

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
end
