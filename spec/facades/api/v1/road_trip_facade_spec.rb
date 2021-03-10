require 'rails_helper'

describe "Road Trip Facade" do
  it "calls directions service and returns correct data" do
    origin = 'denver,co'
    destination = 'pueblo,co'

    facade = RoadTripFacade.new(origin, destination)

    expect(facade[:travel_time]).to be_an(Integer)
    expect(facade[:start_city]).to eq("Denver, CO")
    expect(facade[:end_city]).to eq("Pueblo, CO")
  end
end