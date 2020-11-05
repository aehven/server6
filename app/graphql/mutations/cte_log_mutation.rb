module Mutations
  class CteLogMutation < BaseMutation
    argument :serialNumber, Integer, required: true
    argument :timestamp, Integer, required: true
    argument :content, String, required: true
    
    type Types::CteLogType

    def resolve(params={})
      cte = Cte.find_or_create_by(serial_number: params[:serialNumber])
      CteLog.create!(cte_id: cte.id, timestamp: params[:timestamp], content: params[:content])
    end
  end
end