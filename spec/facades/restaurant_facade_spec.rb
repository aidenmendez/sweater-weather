require 'rails_helper'

describe "Restaurant Facade" do
  it "returns a Restaurant object", :vcr do
    time = 1615246516
    destination = "pueblo,co" 
    term = "hamburger"

    restaurant = RestaurantFacade.get_restaurant(time, destination, term)

    expect(restaurant).to be_a(Restaurant)
  end
end