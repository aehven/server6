class Firmware < ApplicationRecord
  has_paper_trail

  enum kind: [ :BaseStation, :CTE ]

  def image=(value)
    write_attribute(:image, Base64.encode64(value))
  end

  # def image
  #   Base64.decode64(read_attribute(:image))
  # end
end