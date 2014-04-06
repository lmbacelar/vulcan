require 'spec_helper'

describe Its90::Computation do
  context 'validates' do
    it 'numericality of :sub_range, :rtpw, :a, :b, :c, :d, :w660, :c1, :c2, :c3, :c4, :c5' do
      expect(subject).to validate_numericality_of :sub_range
      expect(subject).to validate_numericality_of :rtpw
      expect(subject).to validate_numericality_of :a
      expect(subject).to validate_numericality_of :b
      expect(subject).to validate_numericality_of :c
      expect(subject).to validate_numericality_of :d
      expect(subject).to validate_numericality_of :w660
      expect(subject).to validate_numericality_of :c1
      expect(subject).to validate_numericality_of :c2
      expect(subject).to validate_numericality_of :c3
      expect(subject).to validate_numericality_of :c4
      expect(subject).to validate_numericality_of :c5
    end
  end

  it 'inclusion of :type in ITS-90 types' do
    expect(subject).to ensure_inclusion_of(:sub_range).in_array(Its90::SUB_RANGES)
  end
end
