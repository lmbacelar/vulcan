require 'spec_helper'

describe Iec60751::TemperatureComputation do
  context 'validates' do
    it 'presence of :resistance, :r0, :a, :b, :c' do
      expect(subject).to validate_presence_of :resistance
      expect(subject).to validate_presence_of :r0
      expect(subject).to validate_presence_of :a
      expect(subject).to validate_presence_of :b
      expect(subject).to validate_presence_of :c
    end
  end
end
