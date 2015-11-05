class FoodFacility < ActiveRecord::Base

  validates :city, format: { with: "San Francisco", message: "City Must be San Francisco"}

end
