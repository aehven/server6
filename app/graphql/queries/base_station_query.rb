module Queries
  class BaseStationQuery < Queries::BaseQuery
    description "Returns the base station with the specified serial number"

    type Types::BaseStationType, null: true

    argument :serial_number, Integer, required: true

    def resolve(params={})
      BaseStation.find_by(serial_number: params[:serial_number]) or 
      raise ActiveRecord::RecordNotFound.new("Serial Number #{params[:serial_number]}")
    end
  end
end