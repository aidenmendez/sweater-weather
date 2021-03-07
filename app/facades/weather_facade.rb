class WeatherFacade
  class << self
    def get_forecast(location)
      weather_data = WeatherService.get_forecast(location)
      Forecast.new(weather_data)
    end
  end
end