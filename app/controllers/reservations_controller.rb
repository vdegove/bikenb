class ReservationsController < ApplicationController
  def create
    @bike = Bike.find(params[:bike_id])
    @reservation = Reservation.new(reservations_params)
    authorize @reservation
    @reservation.user = current_user
    @reservation.bike = @bike
    if @reservation.save
      redirect_to dashboard_renter_path
    else
      render :show
    end
  end

  def validate
    @reservation = Reservation.find(params[:id])
    authorize @reservation
    @reservation.validate!
    @reservation.save
    redirect_to dashboard_owner_path
  end

  def decline
    @reservation = Reservation.find(params[:id])
    authorize @reservation
    @reservation.decline!
    @reservation.save
    redirect_to dashboard_owner_path
  end

  private

  def reservations_params
    params.require(:reservation).permit(:starts_at, :ends_at, :bike_id)
  end
end
