class Its90::Computation < ActiveRecord::Base
  validates_presence_of     :sub_range, :rtpw, :a, :b, :c, :d, :w660, :c1, :c2, :c3, :c4, :c5
  validates_numericality_of :sub_range, :rtpw, :a, :b, :c, :d, :w660, :c1, :c2, :c3, :c4, :c5

  validates_inclusion_of    :sub_range, in: Its90::SUB_RANGES

  def self.table_name_prefix
    'its90_'
  end
end
