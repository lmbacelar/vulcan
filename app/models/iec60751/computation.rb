class Iec60751::Computation < ActiveRecord::Base
  validates_presence_of     :r0, :a, :b, :c
  validates_numericality_of :r0, :a, :b, :c

  def self.table_name_prefix
    'iec60751_'
  end
end
