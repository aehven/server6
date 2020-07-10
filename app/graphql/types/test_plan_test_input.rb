module Types
  class TestPlanTestInput < Types::BaseInputObject
    argument :testId, ID, required: true
    argument :duration, Integer, required: true
  end
end