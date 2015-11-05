class FoodFacilityController < ApplicationController

  def index

    @food_facility = FoodFacility.new

  end

end
