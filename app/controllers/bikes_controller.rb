class BikesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @bikes = Bike.all
  end

  def new
    @bike = Bike.new
  end

  def create
    @bike = Bike.new(bikes_params)
    @bike.user = current_user
    if @bike.save
      redirect_to bike_path(@bike)
    else
      render :new
    end
  end

  def show
    @bike = Bike.find(params[:id])
    @reservation = Reservation.new
    @reservation.bike_id = @bike[:id]
  end

  private

  def bikes_params
    params.require(:bike).permit(:name, :description, :address, :price_per_day, :photo)
  end
end