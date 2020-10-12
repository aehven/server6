module Mutations
  class CteDataMutation < BaseMutation
    argument :serialNumber, Integer, required: true
    argument :datasetNumber, Integer, required: true
    argument :timestamp, Integer, required: true
    argument :content, String, required: true
    
    type Types::CteDataType

    def resolve(params={})
      cte = Cte.find_by(serial_number: params[:serialNumber])
      CteData.create!(cte_id: cte.id, dataset_number: params[:datasetNumber], timestamp: params[:timestamp], content: params[:content])
    end
  end
end