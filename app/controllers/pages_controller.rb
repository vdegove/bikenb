class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @bike = Bike.new
  end
end
