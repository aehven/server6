module Mutations
  class CteDxMutation < BaseMutation
    argument :serialNumber, Integer, required: true
    argument :timestamp, Integer, required: true
    argument :content, String, required: true
    
    type Types::CteDexType

    def resolve(params={})
      cte = Cte.find_by(serial_number: params[:serialNumber])
      CteDx.create!(cte_id: cte.id, timestamp: params[:timestamp], content: params[:content])
    end
  end
end