require 'rails_helper'

describe "Final Forecast poro" do
  it "creates a Final Forecast object with a summary and temperature" do
    data = {:summary => "Test summary", :temperature => 43.22}

    final = FinalForecast.new(data)

    expect(final.summary).to eq(data[:summary])
    expect(final.temperature).to eq(data[:temperature])
  end
end