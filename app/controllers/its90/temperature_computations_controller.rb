class Its90::TemperatureComputationsController < ApplicationController
  respond_to :json

  def create
    @computation = Its90::TemperatureComputation.new computation_params
    flash[:notice] = 'Temperature computation was successfully completed' if @computation.save
    respond_with @computation
  end

private
  def computation_params
    params.require(:temperature_computation)
          .permit(:resistance, 
                  :sub_range, 
                  :rtpw,
                  :a, :b, :c, :d, :w660, 
                  :c1, :c2, :c3, :c4, :c5)
  end
end
