class ReservationsController < ApplicationController
  skip_after_action :verify_authorized, only: [:my_bike]

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservations_params)
    authorize @reservation
    @reservation.user = current_user
    @reservation.bike_id = params[:bike_id]
    if @reservation.save
      redirect_to bike_path()
    else
      render :show
    end
  end

  def show
    @reservation = Reservation.find(params[:bike_id])
    authorize @reservation
  end

  private

  def reservations_params
    params.require(:reservation).permit(:starts_at, :ends_at, :bike_id)
  end
end
