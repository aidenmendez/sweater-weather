class Api::V1::ForecastController < ApplicationController
  def index
    begin
      location_coordinates = GeocodeFacade.get_coordinates(params[:location])
      
      require 'pry'; binding.pry
      # forecast_data
    rescue
      render json: {"error" => {"message" => "Something went wrong"}}, status:400
    end
  end
end