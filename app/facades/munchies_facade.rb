class MunchiesFacade
  def initialize(start, destination, food)
    direction = Direction.new(start, destination)

    @destination_city = direction.dest
    @travel_time = direction.time
    @forecast = get_forecast(destination) # make into a poro
    @restaurant = Restaurant.new(@travel_time, destination, food)
  end


  private
  # def format_destination(destination)
  #   # format the destination or figure out where to pull it from
  # end

  # def get_travel_time(start, destination)
  #   # call directions services
  # end


  def get_forecast(destination)
    location_coordinates = GeocodeFacade.get_coordinates(destination)
    forecast = WeatherFacade.get_forecast(location_coordinates)
    
    data = {  
              :summary     => forecast.current_weather.conditions,
              :temperature => forecast.current_weather.temperature
            }
  end
end