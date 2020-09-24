module Types
  class TestResultType < Types::BaseObject
    field :id, ID, null: false
    field :start_time, Integer, null: true
    field :dataset_number, Integer, null: true
    field :status, Integer, null: true
    field :notes, [Integer], null: true    
  end
end
