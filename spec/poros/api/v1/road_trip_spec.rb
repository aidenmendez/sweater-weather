require 'rails_helper'

describe 'Road Trip poro' do
  it "creates a Road Trip object (less than one day away)" do
    start_city = "Denver, CO" 
    end_city = "Pueblo, CO"
    travel_time = 6764
    weather_at_eta = ShortForecast.new(75, "cloudy")

    road_trip = RoadTrip.new(start_city, end_city, travel_time, weather_at_eta)

    expect(road_trip.id).to be_nil
    expect(road_trip.start_city).to eq(start_city)
    expect(road_trip.end_city).to eq(end_city)
    expect(road_trip.travel_time).to eq("1 hours, 52 minutes")
    expect(road_trip.weather_at_eta).to eq(weather_at_eta)
    expect(road_trip.weather_at_eta.temperature).to eq(75)
    expect(road_trip.weather_at_eta.conditions).to eq("cloudy")
  end

  it "creates a Road Trip object (greater than one day away)" do
    start_city = "Denver, CO" 
    end_city = "Faraway, PL"
    travel_time = 174800
    weather_at_eta = ShortForecast.new(28, "snowy")

    road_trip = RoadTrip.new(start_city, end_city, travel_time, weather_at_eta)

    expect(road_trip.id).to be_nil
    expect(road_trip.start_city).to eq(start_city)
    expect(road_trip.end_city).to eq(end_city)
    expect(road_trip.travel_time).to eq("3 days, 0 hours, 33 minutes")
    expect(road_trip.weather_at_eta).to eq(weather_at_eta)
    expect(road_trip.weather_at_eta.temperature).to eq(28)
    expect(road_trip.weather_at_eta.conditions).to eq("snowy")
  end

  it "creates a Road Trip object (about one day away)" do
    start_city = "Denver, CO" 
    end_city = "Philadelphia, PL"
    travel_time = 90400
    weather_at_eta = ShortForecast.new(28, "snowy")

    road_trip = RoadTrip.new(start_city, end_city, travel_time, weather_at_eta)

    expect(road_trip.id).to be_nil
    expect(road_trip.start_city).to eq(start_city)
    expect(road_trip.end_city).to eq(end_city)
    expect(road_trip.travel_time).to eq("1 day, 1 hours, 6 minutes")
    expect(road_trip.weather_at_eta).to eq(weather_at_eta)
    expect(road_trip.weather_at_eta.temperature).to eq(28)
    expect(road_trip.weather_at_eta.conditions).to eq("snowy")
  end
end