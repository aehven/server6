class Firmware < ApplicationRecord
  has_paper_trail

  enum kind: [ :BaseStation, :CTE ]

  def file=(value)
    write_attribute(:file, Base64.encode64(value))
  end

  def file
    Base64.decode64(read_attribute(:file))
  end
end