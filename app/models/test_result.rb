class TestResult < ApplicationRecord
  belongs_to :patients_test_plan

  serialize :notes, Array
end
