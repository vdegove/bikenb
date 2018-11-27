class ReservationsController < ApplicationController
  skip_after_action :verify_authorized, only: [:my_bike]

  def create
    @reservation = Reservation.new(reservations_params)
    authorize @reservation
    @reservation.user = current_user
    @reservation.bike_id = params[:bike_id]
    if @reservation.save
      redirect_to bikes_path
    else
      render :show
    end
  end

  def index
    @reservations = policy_scope(Reservation)
  end

  private

  def reservations_params
    params.require(:reservation).permit(:starts_at, :ends_at, :bike_id)
  end
end
