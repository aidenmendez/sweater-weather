require 'rails_helper'

describe "Backgrounds Service" do
  describe 'happy path' do
    it "returns json object for image of specific location" do
      location = "denver,co"

      # should just return raw data, facade turns into poro
      image = BackgroundsService.get_image(location)

      expect(image.location).to eq("denver,co")
      expect(image.image_url).to be_a(String)

      expect(image.credit.source).to be_a(String)
      expect(image.credit.author).to be_a(String)
      expect(image.credit.logo).to be_a(String)
    end
  end
end