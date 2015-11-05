class FoodFacilitiesController < ApplicationController

  def index

    if params[:food] == "" || params[:food].nil?
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