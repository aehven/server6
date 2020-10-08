module Queries
  class LatestFirmwareQuery < Queries::BaseQuery
    description "Get the latest firmware of the specified kind (BS/CTE)"

    type Types::FirmwareType, null: true

    argument :kind, String, required: true

    def resolve(kind:)
      @firmware = Firmware.send(kind).last
    end
  end
end