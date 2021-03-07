require 'rails_helper'

describe WeatherService do
  describe "(happy path)" do
    it "should return forecast data for given location", :vcr do
      # test with coordinates: latitude 30.264979 longitude=-97.746598
      coordinates = LocationCoordinates.new({lat: 30.264979, lng: -97.746598})

      data = WeatherService.get_forecast(coordinates)

      expect(data[:data]).to eq("")
    end
  end
end