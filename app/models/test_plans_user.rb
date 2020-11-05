class TestPlansUser < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :test_plan
end
