class FoodFacilitiesController < ApplicationController

  def index

    if params[:q] == "" || params[:q].nil?
      @food_facilities = FoodFacility.all
      flash[:notice] = "Empty food query - displaying all food trucks"
    else
      @food_facilities = FoodFacility.q(params[:q])
      flash[:notice] = "Showing food trucks associated with: #{params[:q]}"
    end

    respond_to do |format|
      format.html
      format.json {render :json => @food_facilities.to_json}
    end

  end


  private

  def food_facility_params

    params.permit(:food)

  end

end