require 'spec_helper'

describe Iec60584::Computation do
  context 'validates' do
    it 'numericality of :a3, :a2, :a1, :a0' do
      expect(subject).to validate_numericality_of :a3
      expect(subject).to validate_numericality_of :a2
      expect(subject).to validate_numericality_of :a1
      expect(subject).to validate_numericality_of :a0
    end

    it 'inclusion of :type in IEC 60584 types' do
      expect(subject).to ensure_inclusion_of(:type).in_array(Iec60584::TYPES)
    end
  end
end
