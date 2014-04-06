require 'spec_helper'

describe Its90::TemperatureComputation do
  context 'validates' do
    it 'numericality of :resistance' do
      expect(subject).to validate_numericality_of :resistance
    end

    it 'inclusion of :resistance within ITS-90 resistance range' do
      pending 'should check inclusion on valid resistance for given range'
      # expect(subject).to ensure_inclusion_of(:emf).in_range(Iec60584::emf_RANGE)
    end
  end

  context 'temperature computation' do
    it 'is handled by Its90' do
      expect(Its90).to receive(:t90)
      Its90::TemperatureComputation.new(resistance: 25.0, sub_range: 11).valid?
    end 

    it 'passes existing and default arguments to Its90' do
      expect(Its90).to receive(:t90).with(25.0, 11, 
                                          1.0e-01, 0.00e+00, 0.00e+00, 0.00e+00, 
                                          2.00e-02, 
                                          0.00e+00, 0.00e+00, 0.00e+00, 0.00e+00, 3.00e-03)
      Its90::TemperatureComputation.new(resistance: 25.0, sub_range: 11, a: 1.0e-01, w660: 2.00e-02, c5: 3.00e-03).valid?
    end 

    it 'sets the temperature' do
      Its90.stub(:t90).and_return(-38.8344)
      c = Its90::TemperatureComputation.new resistance: 21.103553, sub_range: 11
      c.valid?
      expect(c.temperature).to eq(-38.8344)
    end 
  end 
end
