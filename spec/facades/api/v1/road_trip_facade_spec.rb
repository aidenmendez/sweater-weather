require 'rails_helper'

describe 'Road Trip Facade' do
  it 'returns a road trip facade', :vcr do
    origin = 'denver,co'
    destination = 'kansas city,mo'

    road_trip = RoadTripFacade.new_trip(origin, destination)

    expect(road_trip.id).to be_nil
    expect(road_trip.start_city).to eq("Denver, CO")
    expect(road_trip.end_city).to eq("Kansas City, MO")
    expect(road_trip.travel_time).to be_a(String)
    expect(road_trip.weather_at_eta).to be_a(ShortForecast)
    expect(road_trip.weather_at_eta.temperature).to be_a(Numeric)
    expect(road_trip.weather_at_eta.conditions).to be_a(String)
  end
end