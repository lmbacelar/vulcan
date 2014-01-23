require 'spec_helper'

describe Iec60751::Computation do
  context 'validates' do
    it 'numericality of :r0, :a, :b, :c' do
      expect(subject).to validate_numericality_of :r0
      expect(subject).to validate_numericality_of :a
      expect(subject).to validate_numericality_of :b
      expect(subject).to validate_numericality_of :c
    end
  end
end
