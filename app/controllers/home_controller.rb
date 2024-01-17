class HomeController < ApplicationController
  def index
    if Rails.env.production?
    @Latitude = request.location.Latitude
    @longitude = request.location.longitude
    end
  end
end
