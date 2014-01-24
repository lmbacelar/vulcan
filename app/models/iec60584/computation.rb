class Iec60584::Computation < ActiveRecord::Base

  self.inheritance_column = nil

  validates_presence_of     :type, :a3, :a2, :a1, :a0
  validates_numericality_of :a3, :a2, :a1, :a0
  validates_inclusion_of    :type, in: Iec60584::TYPES

  def self.table_name_prefix
    'iec60584_'
  end
end
