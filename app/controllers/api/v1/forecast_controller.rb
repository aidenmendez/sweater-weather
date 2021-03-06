class Api::V1::ForecastController < ApplicationController
  def index
    coords = GeocodeFacade.get_coordinates(params[:location])
  end
end