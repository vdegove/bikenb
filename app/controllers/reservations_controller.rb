class ReservationsController < ApplicationController

  def new
    @reservation = reservation.new
  end

  def create
    @reservation = reservation.new
  end
end
