require 'rails_helper'

describe "Weather Facade" do
  describe "(happy path)" do
    it "gets forecast for a location's coordinates", :vcr do
      coords = GeocodeFacade.get_coordinates("san diego,ca")

      forecast = WeatherFacade.get_forecast(coords)

      expect(forecast.current_weather).to be_a(Currently)
      expect(forecast.daily_weather).to be_an(Array)
      expect(forecast.daily_weather[0]).to be_a(Daily)
      expect(forecast.hourly_weather).to be_an(Array)
      expect(forecast.hourly_weather[0]).to be_a(Hourly)
    end

    it "gets a shortened forecast for a destination's coordinates (t < 48 hours away)", :vcr do
      coords = GeocodeFacade.get_coordinates("new york,ny")
      offset_time = 6780

      short_forecast = WeatherFacade.get_short_forecast(coords, offset_time)

      expect(short_forecast.temperature).to be_a(Numeric)
      expect(short_forecast.conditions).to be_a(String)
    end

    it "gets a shortened forecast for a destination's coordinates (t > 48 hours away && t < 691200)", :vcr do
      coords = GeocodeFacade.get_coordinates("new york,ny")
      offset_time = 300500

      short_forecast = WeatherFacade.get_short_forecast(coords, offset_time)

      expect(short_forecast.temperature).to be_a(Numeric)
      expect(short_forecast.conditions).to be_a(String)
    end

    it "gets error message when travel time is more than 8 days (t > 691200)", :vcr do
      coords = GeocodeFacade.get_coordinates("new york,ny")
      offset_time = 691201

      short_forecast = WeatherFacade.get_short_forecast(coords, offset_time)

      expect(short_forecast).to eq("No forecast available for more than 8 days from now.")
    end
  end
end