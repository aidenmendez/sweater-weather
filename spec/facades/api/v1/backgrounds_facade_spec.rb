require 'rails_helper'

describe "Backgrounds Facade" do
  describe "(happy path)" do
    it "returns an image object with a nested credit object", :vcr do
      location = "denver,co"

      # should just return raw data, facade turns into poro
      image = BackgroundsFacade.get_image(location)

      expect(image.location).to eq("denver,co")
      expect(image.image_url).to be_a(String)

      expect(image.credit.source).to be_a(String)
      expect(image.credit.author).to be_a(String)
    end
  end
end