require 'spec_helper'

describe Iec60751::ResistanceComputation do
  context 'validates' do
    it 'numericality of :resistance, :r0, :a, :b, :c' do
      expect(subject).to validate_numericality_of :temperature
      expect(subject).to validate_numericality_of :r0
      expect(subject).to validate_numericality_of :a
      expect(subject).to validate_numericality_of :b
      expect(subject).to validate_numericality_of :c
    end

    it 'inclusion of :temperature within IEC 60751 temperature range' do
      expect(subject).to ensure_inclusion_of(:temperature).in_range(Iec60751::TEMPERATURE_RANGE)
    end
  end

  context 'resistance computation' do
    it 'is handled by Iec60751' do
      expect(Iec60751).to receive(:r)
      Iec60751::ResistanceComputation.new(temperature: 0).valid?
    end 

    it 'passes existing and default arguments to Iec60751' do
      expect(Iec60751).to receive(:r).with(0.0, 101.0, 3.9083e-03, -5.7750e-07, -4.1830e-12)
      Iec60751::ResistanceComputation.new(temperature: 0, r0: 101.0).valid?
    end 

    it 'sets the resistance' do
      Iec60751.stub(:r).and_return(110.0)
      c = Iec60751::ResistanceComputation.new temperature:25.68
      c.valid?
      expect(c.resistance).to eq 110.0
    end 
  end 
end
