class DashboardController < ApplicationController
  skip_after_action :verify_authorized

  def owner
    @reservations = []
    current_user.bikes.each do |bike|
      bike.reservations.each do |reservation|
        @reservations << reservation
      end
    end
  end

  def renter
    @reservations = current_user.reservations
  end
end
