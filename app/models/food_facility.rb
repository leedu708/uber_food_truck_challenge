class FoodFacility
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  APP_TOKEN = 'vWrocSZtse6CvhrrWS1W88ULf'
  DOMAIN = 'data.sfgov.org'
  ENDPOINT = 'rqzj-sfat'

  @@client = SODA::Client.new(
    :domain => DOMAIN,
    :app_token => APP_TOKEN
  )

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end
  
  def persisted?
    false
  end

  def self.all
    @@client.get(ENDPOINT)
  end

  def self.q(str)
    @@client.get(ENDPOINT, '$q' => str)
  end

  def self.q_user_input(food = "pizza", coord = [37.79, -122.39])

    initial_lat = coord[0] - 0.01
    end_lat = coord[0] + 0.01
    initial_long = coord[1] - 0.01
    end_long = coord[1] + 0.01

    fooditems = food.split(", ")
    food_query = get_food_query(fooditems)

    params = { "$where" => "latitude > '#{initial_lat}' AND latitude < '#{end_lat}' AND longitude > '#{initial_long}' AND longitude < '#{end_long}'", 
               "$q"     => food_query,
               "$limit" => 10 }

    response = @@client.get(ENDPOINT, params).select { |key, value| key.to_s.match('location') }

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