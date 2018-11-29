class BikesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :destroy]

  def index
    @bikes = policy_scope(Bike)
  end

  def new
    @bike = Bike.new
    authorize @bike
  end

  def create
    @bike = Bike.new(bikes_params)
    @bike.price_per_day = bikes_params[:price_per_day].to_f*100
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
    @bike = Bike.find(params[:id])
    authorize @bike
  end

  def update
    @bike = Bike.find(params[:id])
    authorize @bike
    @bike.update(bikes_params)
    if @bike.save
      redirect_to bike_path(@bike)
    else
      render :edit
    end
  end

  def destroy
    @bike = Bike.find(params[:id])
    authorize @bike
    @bike.destroy
    redirect_to bikes_path
  end

  private

  def bikes_params
    params.require(:bike).permit(:name, :description, :address, :price_per_day, :photo)
  end
end
