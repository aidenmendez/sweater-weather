class MunchiesFacade
  def initialize(start, destination, food)
    @destination_city = format_destination(destination)

    time = DirectionFacade.get_time(start, destination)
    @travel_time = format_time(time)

    @forecast = get_forecast(destination) # TO DO make into a facade
    
    arrival_time = calc_arrival(time)
    @restaurant = RestaurantFacade.get_restaurant(arrival_time, destination, food)
  end


  private

  def format_destination(destination)
    city_format = destination.gsub(/[,]/, ', ').capitalize
    # finish later
  end

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

  def format_time(seconds)
    hours = Time.at(seconds).utc.strftime "%H"
    minutes = Time.at(seconds).utc.strftime "%M"
    "#{hours} hours #{minutes} minutes"
  end

  def calc_arrival(time)
    open_at = Time.now.utc + time
    open_at.to_time.to_i
  end
end