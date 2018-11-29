class BikesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :destroy]

  def index
    if params[:category] == "Tous" && params[:location].present?
      @bikes = policy_scope(Bike.near(params[:location], 50))
    elsif params[:category] == "Tous"
      @bikes = policy_scope(Bike)
    elsif  params[:category].present?
      @bikes = policy_scope(Bike.search_by_category(params[:category]))
      if params[:location].present?
        @bikes = @bikes.near(params[:location], 50)
      else
        @bikes
      end
    else
      @bikes = policy_scope(Bike)
    end
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
