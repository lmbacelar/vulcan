class Iec60751::ResistanceComputation < ActiveRecord::Base
  validates_presence_of     :temperature, :r0, :a, :b, :c
  validates_numericality_of :temperature, :r0, :a, :b, :c
  validates_inclusion_of    :temperature, in: Iec60751::TEMPERATURE_RANGE

  after_validation :update_resistance

  def update_resistance
    self.resistance = Iec60751.r temperature, r0, a, b, c rescue RangeError
  end

  def self.table_name_prefix
    'iec60751_'
  end
end
