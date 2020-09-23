module Mutations
  class CteDexMutation < BaseMutation
    argument :cteId, ID, required: true
    argument :fileName, String, required: true
    argument :content, String, required: true
    
    type Types::CteDexType

    def resolve(params={})
      CteDex.create!(cte_id: params[:cteId], file_name: params[:fileName], content: params[:content])
    end
  end
end