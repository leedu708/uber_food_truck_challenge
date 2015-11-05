module FoodFacilityHelper

  APP_TOKEN = "1KXOeqR6IrJZlerVAW1YU2Ra0"
  API_URL = "rqzj-sfat"

  def input(food = "pizza", coord = [get_lat, get_long] )

    client = SODA::Client.new( { :domain => "data.sfgov.org", 
                                 :app_token => APP_TOKEN } )

    initial_lat = coord[0] - 0.01
    end_lat = coord[0] + 0.01
    initial_long = coord[1] - 0.01
    end_long = coord[1] + 0.01

    fooditems = food.split(", ")
    food_query = get_food_query(fooditems)

    params = { "$where" => "Latitude > '#{initial_lat}' AND Latitude < '#{end_lat}' AND Longitude > '#{initial_long}' AND Longitude < '#{end_long}'", 
               "$q"     => '#{food_query}',
               "$limit" => 10 }

    response = client.get(API_URL, params)

  end

  def get_food_query(fooditems)

    query = ""

    fooditems.each_with_index do |item, index|

      if index == 0
        query = query + item
      else
        query = query + " OR #{item}"
      end

    end

    query

  end


end
