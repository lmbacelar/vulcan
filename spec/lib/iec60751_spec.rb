require_relative '../../lib/iec60751'

describe Iec60751 do
  context 'valid range' do
    it 'for temperature should be -200.0 ºC to 850.0 ºC' do
      expect(Iec60751::TEMPERATURE_RANGE).to eq -200.0..850.0
    end

    it 'for resistance should be 18.5201 to 390.4811 Ohm' do
      expect(Iec60751::RESISTANCE_RANGE).to eq 18.5201..390.4811
    end
  end

end
