class Iec60751::TemperatureComputation < ActiveRecord::Base
  validates_presence_of :resistance, :r0, :a, :b, :c

  before_validation :update_temperature

  def update_temperature
    self.temperature = 0
  end

  def self.table_name_prefix
    'iec60751_'
  end
end
