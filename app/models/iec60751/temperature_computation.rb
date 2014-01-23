class Iec60751::TemperatureComputation < Iec60751::Computation
  validates :resistance, presence: true, 
                         numericality: true, 
                         inclusion: { in: Iec60751::RESISTANCE_RANGE }

  after_validation :update_temperature

  def update_temperature
    self.temperature = Iec60751.t90 resistance, r0, a, b, c rescue RangeError
  end
end
