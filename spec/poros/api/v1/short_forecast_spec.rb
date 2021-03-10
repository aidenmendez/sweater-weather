require 'rails_helper'

describe "Short Forecast" do
  it "creates a Short Forecast poro" do
    temperature = 75
    conditions = "sunny"

    short_forecast = ShortForecast.new(temperature, conditions)

    expect(short_forecast.temperature).to eq(temperature)
    expect(short_forecast.conditions).to eq(conditions)
  end
end