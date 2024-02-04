class BranchesController < ApplicationController

  def index
    @branches = Branch.all
  end

  def show
    @branch = Branch.find(params[:id])
  end



  def nearest
    miles = false
    @lat1 = params[:lat1].to_f
    @lon1= params[:lon1].to_f

    puts "#{@lat1}"
    puts "#{@lon1}"

    branches = Branch.all
    nearest_distance = Float::MAX
    @nearest_branch = nil

    branches.each do |branch|
      lat2 = branch.latitude
      lon2 = branch.longitude

      dLat = (lat2 - @lat1) * Math::PI / 180
      dLon = (lon2 - @lon1) * Math::PI / 180
      a = Math.sin(dLat / 2) * Math.sin(dLat / 2) +
          Math.cos(@lat1 * Math::PI / 180) * Math.cos(lat2 * Math::PI / 180) *
          Math.sin(dLon / 2) * Math.sin(dLon / 2)
      c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a))
      distance = 6371 * c * (miles ? 1 / 1.6 : 1)

      puts "distance: #{distance}"


      if distance < nearest_distance
        nearest_distance = distance
        @nearest_branch = branch
      end
    end

    if @nearest_branch.present?
      redirect_to branch_path(@nearest_branch.id)
    else
      redirect_to root_path, alert: "No nearest branch found."
    end
  end




end
