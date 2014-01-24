require 'spec_helper'

describe Iec60584::TemperatureComputation do
  context 'validates' do
    it 'numericality of :emf' do
      expect(subject).to validate_numericality_of :emf
    end

    it 'inclusion of :emf within IEC 60584 emf range' do
      pending 'should check inclusion on valid emf for given type'
      # expect(subject).to ensure_inclusion_of(:emf).in_range(Iec60584::emf_RANGE)
    end
  end

  context 'temperature computation' do
    it 'is handled by Iec60584' do
      expect(Iec60584).to receive(:t90)
      Iec60584::TemperatureComputation.new(emf: 0).valid?
    end 

    it 'passes existing and default arguments to Iec60584' do
      expect(Iec60584).to receive(:t90).with(0.0, 'K', 0.0e+00, 0.0e+00, 0.0e+00, 1.0e-03)
      Iec60584::TemperatureComputation.new(emf: 0.0, type: 'K', a0: 1.0e-03).valid?
    end 

    it 'sets the temperature' do
      Iec60584.stub(:t90).and_return(127.0)
      c = Iec60584::TemperatureComputation.new emf: 5.206
      c.valid?
      expect(c.temperature).to eq 127.0
    end 
  end 
end
