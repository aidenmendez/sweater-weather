class RoadTripFacade
  class << self
    def new_trip(origin, destination)
      direction_stats = DirectionsFacade.get_directions(origin, destination)
      if direction_stats[:travel_time] == "impossible"
        weather_at_eta = ShortForecast.new
      else
        destination_coordinates = GeocodeFacade.get_coordinates(destination)
        weather_at_eta = WeatherFacade.get_short_forecast(destination_coordinates, direction_stats[:travel_time])
      end

      RoadTrip.new(direction_stats[:start_city], direction_stats[:end_city], direction_stats[:travel_time], weather_at_eta)
    end
  end
end