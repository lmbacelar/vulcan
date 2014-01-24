require 'spec_helper'

describe Iec60584::EmfComputation do
  context 'validates' do
    it 'numericality of :temperature' do
      expect(subject).to validate_numericality_of :temperature
    end

    it 'inclusion of :temperature within IEC 60584 temperature range' do
      pending 'should check inclusion on valid temperature for given type'
      # expect(subject).to ensure_inclusion_of(:temperature).in_range(Iec60584::TEMPERATURE_RANGE)
    end
  end

  context 'emf computation' do
    it 'is handled by Iec60584' do
      expect(Iec60584).to receive(:emf)
      Iec60584::EmfComputation.new(temperature: 0).valid?
    end 

    it 'passes existing and default arguments to Iec60584' do
      expect(Iec60584).to receive(:emf).with(0.0, 'K', 0.0e+00, 0.0e+00, 0.0e+00, 1.0e-03)
      Iec60584::EmfComputation.new(temperature: 0.0, type: 'K', a0: 1.0e-03).valid?
    end 

    it 'sets the emf' do
      Iec60584.stub(:emf).and_return(5.206)
      c = Iec60584::EmfComputation.new temperature: 127.0, type: 'K'
      c.valid?
      expect(c.emf).to eq 5.206
    end 
  end 
end
