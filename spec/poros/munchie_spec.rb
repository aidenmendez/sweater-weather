require 'rails_helper'

describe "Munchie poro" do
  it "Create a Munchie object", :vcr do
    start = "denver,co"
    destination = "pueblo,co" 
    food = "hamburger"

    munchie = Munchie.new(start, destination, food)

    expect(munchie.id).to be_nil
    expect(munchie.destination_city).to be_a(String)
    expect(munchie.travel_time).to be_a(String)
    expect(munchie.forecast).to be_a(FinalForecast)
    expect(munchie.restaurant).to be_a(Restaurant)
  end
end