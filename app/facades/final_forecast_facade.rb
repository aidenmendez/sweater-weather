class FinalForecastFacade
  class << self
    def get_forecast(destination)
      location_coordinates = GeocodeFacade.get_coordinates(destination)
      forecast = WeatherFacade.get_forecast(location_coordinates)
      
      data = {  
        :summary     => forecast.current_weather.conditions,
        :temperature => forecast.current_weather.temperature
      }
      
      FinalForecast.new(data)
    end
  end
end