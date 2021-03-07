class WeatherService
  class << self
    def conn
      Faraday.new("https://api.openweathermap.org/data/2.5") do |req|
        req.params['appid'] = ENV['OPEN_WEATHER_KEY']
        req.params['units'] = 'imperial'
        # req.params['exclude'] = 'minutely,alerts'
      end
    end
  
    def get_forecast(location)
      response = conn.get("onecall") do |req|
        req.params[:lat] = location.lattitude
        req.params[:lon] = location.longitude
      end

      if response.status == 200
        JSON.parse(response.body, symbolize_names: true)
      end
    end
  end
end