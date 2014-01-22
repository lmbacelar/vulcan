class Iec60751::TemperatureComputation < ActiveRecord::Base
  before_validation :update_temperature

  def update_temperature
    self.temperature = 0
  end
end
