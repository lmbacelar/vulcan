class Iec60751::TemperatureComputation < ActiveRecord::Base
  validates_presence_of     :resistance, :r0, :a, :b, :c
  validates_numericality_of :resistance, :r0, :a, :b, :c
  validates_inclusion_of    :resistance, in: Iec60751::RESISTANCE_RANGE

  after_validation :update_temperature

  def update_temperature
    self.temperature = Iec60751.t90 resistance
  end

  def self.table_name_prefix
    'iec60751_'
  end
end
