require 'rails_helper'

describe "Final Forecast Facade" do
  it "returns a Restaurant object", :vcr do
    destination = "pueblo,co" 
    forecast = FinalForecastFacade.get_forecast(destination)

    expect(forecast).to be_a(FinalForecast)
  end
end