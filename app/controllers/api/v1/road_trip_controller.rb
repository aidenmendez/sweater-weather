class Api::V1::RoadTripController < ApplicationController
  def create
    user = User.find_by(api_key: params[:api_key])
    
    if user
      direction_stats = DirectionsFacade.get_directions(params[:origin], params[:destination])
      destination_coordinates = GeocodeFacade.get_coordinates(params[:destination])
      weather_at_eta = WeatherFacade.get_short_forecast(destination_coordinates, direction_stats[:travel_time])
      road_trip = RoadTrip.new(direction_stats[:start_city], direction_stats[:end_city], direction_stats[:travel_time], weather_at_eta)
      
      render json: RoadTripSerializer.new(road_trip), status: 201
    else
      render json: {"error" => {"message" => "Unauthorized. Invalid or missing API key."}}, status:401
    end
  end
end