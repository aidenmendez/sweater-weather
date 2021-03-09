require 'rails_helper'

describe "Image poro" do
  it "Creates an Image object" do
    location = "denver,co"
    username = "aidenthephotographer"
    image_url = "www.unsplash.com/32423erewrfe"

    image = Image.new(image_url, username, location)

    expect(image.location).to eq(location)
    expect(image.image_url).to be_a(image_url)

    expect(image.credit.author).to eq(username)
    expect(image.credit.source).to be_a(String)
  end
end