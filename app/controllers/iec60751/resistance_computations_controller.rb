class Iec60751::ResistanceComputationsController < ApplicationController
  respond_to :json

  def create
    @computation = Iec60751::ResistanceComputation.new computation_params
    flash[:notice] = 'Resistance computation was successfully completed' if @computation.save
    respond_with @computation
  end

private
  def computation_params
    params.require(:resistance_computation)
          .permit(:temperature, :r0, :a, :b, :c)
  end
end
