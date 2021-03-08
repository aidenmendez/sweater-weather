class Api::V1::ForecastController < ApplicationController
  def index
    begin
      location_coordinates = GeocodeFacade.get_coordinates(params[:location])
      forecast = WeatherFacade.get_forecast(location_coordinates)
      
      render json: ForecastSerializer.new(forecast)
    rescue
      render json: {"error" => {"message" => "Something went wrong"}}, status:400
    end
  end
end