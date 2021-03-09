require 'rails_helper'

describe "Backgrounds Service" do
  describe 'happy path' do
    it "returns json object for image of specific location" do
      location = "denver,co"

      image_data = BackgroundsService.get_image(location)

      image_data[:results][0][:urls][:raw].to be_a(String)
    end
  end
end