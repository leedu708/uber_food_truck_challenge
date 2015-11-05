module FoodFacilityHelper

  APP_TOKEN = "1KXOeqR6IrJZlerVAW1YU2Ra0"
  API_URL = "rqzj-sfat"

  def input(fooditems = "pizza", coord = [get_lat, get_long] )

    client = SODA::Client.new( { :domain => "data.sfgov.org", 
                                 :app_token => APP_TOKEN } )

    initial_lat = coord[0] - 0.1
    end_lat = coord[0] + 0.1
    initial_long = coord[1] - 0.1
    end_long = coord[1] + 0.1

    params = { "$where" => "Latitude > '#{initial_lat}' AND Latitude < '#{end_lat}' AND Longitude > '#{initial_long}' AND Longitude < '#{end_long}'", 
               "$q"     => '#{fooditems}'
               "$limit" => 10 }

    response = client.get(API_URL, params)

  end



end
