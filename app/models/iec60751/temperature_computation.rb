module Iec60751
  class TemperatureComputation
    include ActiveModel::Model
    attr_accessor :resistance, :temperature
  end
end
