require 'rails_helper'

describe 'Road Trip poro' do
  it "creates a Road Trip object" do
    start_city = "Denver, CO" 
    end_city = "Pueblo, CO"
    travel_time = 6764
    weather_at_eta = ShortForecast.new(75, "cloudy")

    road_trip = RoadTrip.new(start_city, end_city, travel_time, weather_at_eta)

    expect(road_trip.id).to be_nil
    expect(road_trip.start_city).to eq(start_city)
    expect(road_trip.end_city).to eq(end_city)
    expect(road_trip.travel_time).to eq("01 hours, 52 minutes")
    expect(road_trip.weather_at_eta).to eq(weather_at_eta)
    expect(road_trip.weather_at_eta.temperature).to eq(75)
    expect(road_trip.weather_at_eta.conditions).to eq("cloudy")
  end
end