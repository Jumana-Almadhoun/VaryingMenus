class BranchesController < ApplicationController

  def index
    @branches = Branch.all
  end

  def show
    @branch = Branch.find(params[:id])
  end


  # def nearest
  #   puts "hihihihi"
  #   params[:lat1, :lon1]


  #       branches = Branch.all
  #       nearest_distance = Float::MAX
  #       @nearest_branch = nil

  #       branches.each do |branch|
  #         lat2 = branch.latitude
  #         lon2 = branch.longitude
  #         # Calculate distance using the haversine formula
  #         dLat = (lat2 - lat1) * Math::PI / 180
  #         dLon = (lon2 - lon1) * Math::PI / 180
  #         a = Math.sin(dLat / 2) * Math.sin(dLat / 2) +
  #             Math.cos(lat1 * Math::PI / 180) * Math.cos(lat2 * Math::PI / 180) *
  #             Math.sin(dLon / 2) * Math.sin(dLon / 2)
  #         c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a))
  #         distance = 6371 * c * (miles ? 1 / 1.6 : 1)
  #         # Update nearest branch if the current one is closer
  #         if distance < nearest_distance
  #           nearest_distance = distance
  #           @nearest_branch = branch
  #         end
  #       end

  #       if @nearest_branch.present?
  #         redirect_to branch_path(@nearest_branch.id)
  #       else
  #         # Handle the case where no nearest branch is found
  #         redirect_to root_path, alert: "No nearest branch found."
  #       end

  # end


  def self.haversine_distance(lat1, lon1, miles = false)
    branches = Branch.all
    nearest_distance = Float::MAX
    @nearest_branch = nil

    branches.each do |branch|
      lat2 = branch.latitude
      lon2 = branch.longitude
      # Calculate distance using the haversine formula
      dLat = (lat2 - lat1) * Math::PI / 180
      dLon = (lon2 - lon1) * Math::PI / 180
      a = Math.sin(dLat / 2) * Math.sin(dLat / 2) +
          Math.cos(lat1 * Math::PI / 180) * Math.cos(lat2 * Math::PI / 180) *
          Math.sin(dLon / 2) * Math.sin(dLon / 2)
      c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a))
      distance = 6371 * c * (miles ? 1 / 1.6 : 1)
      # Update nearest branch if the current one is closer
      if distance < nearest_distance
        nearest_distance = distance
        @nearest_branch = branch
      end
    end
     return @nearest_branch
  end

end
