class Iec60751::ResistanceComputation < Iec60751::Computation
  validates :temperature, presence: true, 
                          numericality: true,
                          inclusion:{ in: Iec60751::TEMPERATURE_RANGE }

  after_validation :update_resistance

  def update_resistance
    self.resistance = Iec60751.r temperature, r0, a, b, c rescue RangeError
  end
end
