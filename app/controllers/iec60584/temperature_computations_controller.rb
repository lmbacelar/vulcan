class Iec60584::TemperatureComputationsController < ApplicationController
  respond_to :json

  def create
    @computation = Iec60584::TemperatureComputation.new computation_params
    flash[:notice] = 'Temperature computation was successfully completed' if @computation.save
    respond_with @computation
  end

private
  def computation_params
    params.require(:temperature_computation)
          .permit(:emf, :type, :a3, :a2, :a1, :a0)
  end
end
