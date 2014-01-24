class Iec60584::TemperatureComputation < Iec60584::Computation
  validates :emf, presence: true, 
                  numericality: true

  after_validation :update_temperature

  def update_temperature
    self.temperature = Iec60584.t90 emf, type, a3, a2, a1, a0 rescue RangeError
  end
end
