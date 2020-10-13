class TestPlansUser < ApplicationRecord
  belongs_to :user
  belongs_to :test_plan
end
