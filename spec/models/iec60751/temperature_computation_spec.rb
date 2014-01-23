require 'spec_helper'

describe Iec60751::TemperatureComputation do
  context 'validates' do
    it 'numericality of :resistance' do
      expect(subject).to validate_numericality_of :resistance
    end

    it 'inclusion of :resistance within IEC 60751 resistance range' do
      expect(subject).to ensure_inclusion_of(:resistance).in_range(Iec60751::RESISTANCE_RANGE)
    end
  end

  context 'temperature computation' do
    it 'is handled by Iec60751' do
      expect(Iec60751).to receive(:t90)
      Iec60751::TemperatureComputation.new(resistance: 100).valid?
    end 

    it 'passes existing and default arguments to Iec60751' do
      expect(Iec60751).to receive(:t90).with(100.0, 101.0, 3.9083e-03, -5.7750e-07, -4.1830e-12)
      Iec60751::TemperatureComputation.new(resistance: 100, r0: 101.0).valid?
    end 

    it 'sets the temperature' do
      Iec60751.stub(:t90).and_return(25.68)
      c = Iec60751::TemperatureComputation.new resistance:110
      c.valid?
      expect(c.temperature).to eq 25.68
    end 
  end 
end
