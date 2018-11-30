class DashboardController < ApplicationController
  skip_after_action :verify_authorized

  def owner
    @bikes = current_user.bikes
    @reservations = current_user.reservations_as_owner
    @reservations.reverse!
  end

  def renter
    @reservations = current_user.reservations
  end
end
