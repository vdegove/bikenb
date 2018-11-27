class DashboardController < ApplicationController
  skip_after_action :verify_authorized

  def owner
    @bikes = current_user.bikes
    @reservations = current_user.reservations_as_owner
  end

  def renter
  end
end
