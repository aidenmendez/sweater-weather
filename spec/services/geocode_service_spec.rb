require 'rails_helper'

descibe GeocodeService do
  describe "(happy path)" do
    it "should get lattitude and longitude when given a city and state" do
      params = {"denver,co"}
      data = GeocodeService.get_coordinates(params)[:data]

      expect(data[:lattitude]).to eq("555")
      expect(data[:lattitude]).to eq("12098")
    end
  end

  describe "(sad path)" do
    xit "should return coordinates for center of US when location isn't found" do

    end

    xit "errors when location parameter is missing" do

    end
  end
end