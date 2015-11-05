class FoodFacilityController < ApplicationController

  def index

    @search = FoodFacility.new

  end

  private

  def white_listed_params

    params.require(:food_facility).permit(:food)

  end

end
