require 'rails_helper'

describe "Location Coordinates poro" do
  it "Create a Location Coordinates object" do
    data = {:lat => 234235.23, :lng => -23223.4}

    final = LocationCoordinates.new(data)

    expect(final.lattitude).to eq(data[:lat])
    expect(final.longitude).to eq(data[:lng])
  end
end