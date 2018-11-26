class ReservationsController < ApplicationController

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservations_params)
    @reservation.user = current_user
    @reservation.bike_id = params[:bike_id]
    raise
    if @reservation.save
      redirect_to bikes_path
    else
      render :show
    end
  end

  private

  def reservations_params
    params.require(:reservation).permit(:starts_at, :ends_at, :bike_id)
  end
end
