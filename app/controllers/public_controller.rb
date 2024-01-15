class PublicController < ApplicationController
  def index
    if Rails.env.production?
    @country = request.location.country
    end
  end
end
