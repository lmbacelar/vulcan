class Iec60584::EmfComputationsController < ApplicationController
  respond_to :json

  def create
    @computation = Iec60584::EmfComputation.new computation_params
    flash[:notice] = 'Emf computation was successfully completed' if @computation.save
    respond_with @computation
  end

private
  def computation_params
    params.require(:emf_computation)
          .permit(:temperature, :type, :a3, :a2, :a1, :a0)
  end
end
