class Api::V1::RoadTripController < ApplicationController
  def create
    user = User.find_by(api_key: params[:api_key])
    
    if user
      road_trip = RoadTripFacade.new_trip(params[:origin], params[:destination])
      render json: RoadTripSerializer.new(road_trip), status: 201
    else
      render json: {"error" => {"message" => "Unauthorized. Invalid or missing API key."}}, status:401
    end
  end
end