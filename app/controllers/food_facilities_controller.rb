class FoodFacilitiesController < ApplicationController

  def index

    @food_facilities = FoodFacility.all

    if params[:food] = ""
      @food_facilities = FoodFacility.all
    else
      @food_facilities = FoodFacility.q_user_input(params[:food])
    end

  end


  private

  def food_facility_params

    params.permit(:food)

  end

end