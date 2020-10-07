class BaseStation < ApplicationRecord
  has_paper_trail

  serialize :encryption_key, Array

  belongs_to :organization, optional: true
end
