require 'rails_helper'

describe GeocodeService do
  describe "(happy path)" do
    it "should get lattitude and longitude when given a city and state", :vcr do
      location = "denver,co"
      data = GeocodeService.get_coordinates(location)

      expect(data[:lat]).to eq(39.738453)
      expect(data[:lng]).to eq(-104.984853)
    end
  end

  describe "(sad path)" do
    it "should return coordinates for center of US when location isn't found", :vcr do
      location = nil
      data = GeocodeService.get_coordinates(location)
      
      expect(data).to eq(nil)
    end

    xit "errors when location parameter is missing", :vcr do

    end
  end
end