module Mutations
  class CteDataMutation < BaseMutation
    argument :cteId, ID, required: true
    argument :datasetNumber, Integer, required: true
    argument :fileName, String, required: true
    argument :content, String, required: true
    
    type Types::CteDataType

    def resolve(params={})
      CteData.create!(cte_id: params[:cteId], dataset_number: params[:datasetNumber], file_name: params[:fileName], content: params[:content])
    end
  end
end