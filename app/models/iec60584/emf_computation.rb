class Iec60584::EmfComputation < Iec60584::Computation
  validates :temperature, presence: true, 
                          numericality: true

  after_validation :update_emf

  def update_emf
    self.emf = Iec60584.emf temperature, type, a3, a2, a1, a0 rescue RangeError
  end
end
