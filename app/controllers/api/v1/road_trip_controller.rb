class Api::V1::RoadTripController < ApplicationController
  def create
    # mapquest direction endpoint(pass start, end) => returns travel time (seconds), start city (formatted), end city (formatted)
    direction_stats = DirectionsFacade.get_directions(params[:origin], params[:destination])
    destination_coordinates = GeocodeFacade.get_coordinates(params[:destination])

    # call weather_at_eta facade to get short forecast poro
    weather_at_eta = WeatherFacade.get_short_forecast(destination_coordinates, direction_stats[:travel_time])
    
    #create RoadTrip poro-- pass start_city, end_city, travel_time, weather_at_eta, 
    road_trip = RoadTrip.new(direction_stats[:start_city], direction_stats[:end_city], direction_stats[:travel_time], weather_at_eta)
    
    render json: RoadTripSerializer.new(road_trip), status: 201

    # send authentication error if key isn't provided
  end
end