class Api::V1::RoadTripController < ApplicationController
  def create
    # mapquest direction endpoint(pass start, end) => returns travel time (seconds), start city (formatted), end city (formatted)
    # call weather_at_eta facade (pass end city and travel time)
        # call weather service for hourly forecasts
        # calculate arrival time
        # select hourly forecast for arrival time
        # create & return weather_at_eta poro
    # serialize

    # send authentication error if key isn't provided
  end
end