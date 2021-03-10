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
        hour_forecast = find_hourly(arrival_time, forecast_data[:hourly])
        temperature = hour_forecast[:temp]
        conditions = hour_forecast[:weather][0][:description]
        ShortForecast.new(temperature, conditions)
      elsif offset_time > 172800 && offset_time <=691200 # between 48 hours and 8 days
        day_forecast = find_daily(arrival_time, forecast_data[:daily])
        temperature = day_forecast[:temp][:day]
        conditions = day_forecast[:weather][0][:description]
        forecast = ShortForecast.new(temperature, conditions)
      else
        "No forecast available for more than 8 days from now."
      end
    end

    private

    def calc_arrival(time)
      open_at = Time.now.utc + time
      open_at.to_time.to_i
    end

    def find_hourly(time, data)
      data.find { |hour_data| Time.at(hour_data[:dt]).hour == Time.at(time).hour }
    end
    
    def find_daily(time, data)
      data.find { |full_day| Time.at(full_day[:dt]).day == Time.at(time).day}
    end
  end
end