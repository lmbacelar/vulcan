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

    it 'numericality of :resistance, :r0, :a, :b, :c' do
      expect(subject).to validate_numericality_of :resistance
      expect(subject).to validate_numericality_of :r0
      expect(subject).to validate_numericality_of :a
      expect(subject).to validate_numericality_of :b
      expect(subject).to validate_numericality_of :c
    end

    it 'inclusion of :resistance within IEC 60751 resistance range' do
      expect(subject).to ensure_inclusion_of(:resistance).in_range(Iec60751::RESISTANCE_RANGE)
    end
  end

  context 'temperature computation' do
    it 'is handled by Iec60751' do
      expect(Iec60751).to receive(:t90).with(100)
      Iec60751::TemperatureComputation.new(resistance: 100).valid?
    end 

    it 'sets the temperature' do
      Iec60751.stub(:t90).and_return(25.68)
      c = Iec60751::TemperatureComputation.new resistance:110
      c.valid?
      expect(c.temperature).to eq 25.68
    end 
  end 
end
