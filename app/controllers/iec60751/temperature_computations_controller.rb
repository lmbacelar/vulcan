class Iec60751::TemperatureComputationsController < ApplicationController
  respond_to :json

  def create
    @computation = Iec60751::TemperatureComputation.new computation_params
    flash[:notice] = 'Temperature computation was successfully completed' if @computation.save
    respond_with @computation
  end

private
  def computation_params
    params.require(:temperature_computation)
          .permit(:resistance, :r0, :a, :b, :c)
  end
end
