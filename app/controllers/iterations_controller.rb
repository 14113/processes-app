class IterationsController < ApplicationController
  before_action :set_trip
  before_action :set_iteration, only: [:edit, :update, :finished]

  def index
    service = ActionBuilder.new(@trip)
    iteration = service.run
    redirect_to [:edit, @trip, iteration]
  end

  def finished
    respond_to do |format|
      if @iteration.finish!
        format.html { redirect_to [:done, @trip, @iteration], notice: 'Iteration was successfully finished!.' }
        format.js { head :no_content }
      else
        format.html { render action: 'edit' }
        format.js { render json: @iteration.errors, status: :unprocessable_entity }
      end
    end
  end

  def done
  end

  def edit
  end

  def update
    respond_to do |format|
      if @iteration.update(todo_params)
        format.html { redirect_to [@trip, @iteration], notice: 'Iteration was successfully updated.' }
        format.js { head :no_content }
      else
        format.html { render action: 'edit' }
        format.js { render json: @iteration.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def set_trip
      @trip = Trip.find(params[:trip_id])
    end

    def set_iteration
      return if @trip.nil?
      @iteration = @trip.iterations.find(params[:id])
    end

    def todo_params
      params.require(:iteration).permit(:id, actions_attributes: [:id, :done])
    end
end
