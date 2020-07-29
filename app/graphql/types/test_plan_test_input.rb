module Types
  class TestPlanTestInput < Types::BaseInputObject
    argument :testId, ID, required: true
    argument :duration, Integer, required: true
    argument :highRes, Boolean, required: true
  end
end