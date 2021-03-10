class Api::V1::RoadTripController < ApplicationController
  def create
    # mapquest direction endpoint(pass start, end) => returns travel time (seconds), start city (formatted), end city (formatted)
    direction_stats = DirectionsFacade.get_directions(params[:origin], params[:destination])
    destination_coordinates = GeocodeFacade.get_coordinates(params[:destination])

    # call weather_at_eta facade (pass end city and travel time)
    weather_at_eta = WeatherFacade.get_short_forecast(destination_coordinates, direction_stats[:travel_time])
        # call weather service for hourly forecasts
        # calculate arrival time
        # select hourly forecast for arrival time
        # create & return weather_at_eta poro

    #create RoadTrip poro-- pass start_city, end_city, travel_time, weather_at_eta, 
    # serialize

    # send authentication error if key isn't provided
  end
end