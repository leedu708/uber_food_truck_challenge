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
end