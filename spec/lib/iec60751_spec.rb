require_relative '../../lib/iec60751'
require 'json'

examples = JSON.parse(File.read('spec/assets/lib/iec60751/examples.json'), symbolize_names: true)

describe Iec60751 do
  context 'valid range' do
    it 'for temperature should be -200.0 ºC to 850.0 ºC' do
      expect(Iec60751::TEMPERATURE_RANGE).to eq -200.0..850.0
    end

    it 'for resistance should be 18.5201 to 390.4811 Ohm' do
      expect(Iec60751::RESISTANCE_RANGE).to eq 18.5201..390.4811
    end
  end

  context 'resistance computation' do
    context 'standard coefficients' do
      examples.each do |example|
        it "yields #{example[:r]} Ohm when t90 equals #{example[:t90]} Celsius" do
          expect(Iec60751.r example[:t90]).to be_within(1e-4).of(example[:r])
        end 
      end 
    end

    context 'non-standard coefficients' do
      it 'yields 101.0 Ohm when temperature equals 0.0 Celsius for r0 = 101.0 Ohm' do
        expect(Iec60751.r 0, 101).to be_within(1e-4).of(101)
      end
    end

    context 'out of range temperatures' do
      it 'raise RangeError' do
        expect { Iec60751.r -201.0 }.to raise_error RangeError
      end
    end
  end

  context 'temperature computation' do
    context 'standard coefficients' do
      examples.each do |example|
        it "yields #{example[:t90]} Celius when resistance equals #{example[:r]} Ohm" do
          expect(Iec60751.t90 example[:r]).to be_within(1e-4).of(example[:t90])
        end
      end
    end

    context 'non-standard coefficients' do
      it 'yields 0.0 Celsius when resistance equals 101.0 Ohm for r0 = 101.0 Ohm' do
        expect(Iec60751.t90 101, 101).to be_within(1e-4).of(0)
      end
    end

    context 'out of range resistances' do
      it 'raise RangeError' do
        expect { Iec60751.t90 18.5 }.to raise_error RangeError
      end
    end
 end
end
