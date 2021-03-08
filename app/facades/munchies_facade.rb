class MunchiesFacade
  def initialize(start, destination, food)
    @forecast = get_forecast(destination)
    @destination_city = format_destination(destination)
    @travel_time = get_travel_time(start, destination)
  end


  private
  def get_forecast(destination)
    location_coordinates = GeocodeFacade.get_coordinates(destination)
    forecast = WeatherFacade.get_forecast(location_coordinates)
    require 'pry'; binding.pry
   data = {  summary: forecast.current_weather.conditions,
            temperature: forecast.current_weather.temperature
          }
  end
end