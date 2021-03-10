class WeatherFacade
  class << self
    def get_forecast(location)
      weather_data = WeatherService.get_forecast(location)
      forecast = Forecast.new(weather_data)
    end

    def get_short_forecast(location, offset_time)
      # call weather service for hourly forecasts
      forecast_data = WeatherService.get_forecast(location)
      arrival_time = calc_arrival(offset_time)
      
      if offset_time <= 172800 #less than 2 days
        # offset current
        find_hourly(arrival_time, forecast_data[:hourly])
      elsif offset_time > 172800 && offset_time <=691200 # between 48 hours and 8 days
        find_daily(arrival_time, forecast_data[:daily])
      else
        # Weather data isn't available
      end

      # calculate arrival time
      # select hourly forecast for arrival time
      # return Destination Forecast poro instance
    end

    private

    def calc_arrival(time)
      open_at = Time.now.utc + time
      open_at.to_time.to_i
    end

    def find_hourly(time, data)
      data[:hourly].find { |segment| Time.at(segment[:dt]).hour == Time.at(time).hour }
    end
    
    def find_daily(time, data)
      require 'pry'; binding.pry
      data[:hourly].map { |hour| Time.at(hour[:dt]).day }
    end
  end
end