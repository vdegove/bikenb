class BikesController < ApplicationController
  def new
    @bike = Bike.new
  end

  def create
     @bike = Bike.new(bikes_params)
    if @bike.save
      redirect_to bikes_path(@bike)
    else
      render :new
    end
  end

  private

  def bikes_params
    params.require(:bike).permit(:name, :description, :address, :price_per_day, :photo)
  end
end
