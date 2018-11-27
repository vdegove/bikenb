class BikesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  skip_after_action :verify_authorized, only: [:my_bike]


  def index
    @bikes = policy_scope(Bike)
  end

  def new
    @bike = Bike.new
    authorize @bike
  end

  def create
    @bike = Bike.new(bikes_params)
    authorize @bike
    @bike.user = current_user
    if @bike.save
      redirect_to bike_path(@bike)
    else
      render :new
    end
  end

  def show
    @bike = Bike.find(params[:id])
    authorize @bike
    @reservation = Reservation.new
    @reservation.bike_id = @bike[:id]
  end

  def edit
  end

  def update
  end

  private

  def bikes_params
    params.require(:bike).permit(:name, :description, :address, :price_per_day, :photo)
  end
end
