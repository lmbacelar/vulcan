class Iec60751::TemperatureComputationsController < ApplicationController
  def create
    @temperature = Iec60751::TemperatureComputation.new temperature: '0'
    render json: @temperature
  end
end
