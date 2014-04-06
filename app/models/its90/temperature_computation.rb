class Its90::TemperatureComputation < Its90::Computation
  validates :resistance, presence: true, 
                         numericality: true # , inclusion: { in: Its90::RESISTANCE_RANGE }

  after_validation :update_temperature

  def update_temperature
    self.temperature = Its90.t90 resistance, sub_range, a, b, c, d, w660, c1, c2, c3, c4, c5 rescue RangeError
  end
end
