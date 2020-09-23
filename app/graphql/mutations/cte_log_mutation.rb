module Mutations
  class CteLogMutation < BaseMutation
    argument :cteId, ID, required: true
    argument :fileName, String, required: true
    argument :content, String, required: true
    
    type Types::CteLogType

    def resolve(params={})
      CteLog.create!(cte_id: params[:cteId], file_name: params[:fileName], content: params[:content])
    end
  end
end