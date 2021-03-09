require 'rails_helper'

describe "Image poro" do
  it "Creates an Image object" do
    location = "denver,co"
    username = "aidenthephotographer"
    url = "www.unsplash.com/32423erewrfe"

    image = Image.new(url, username, location)

    expect(image.location).to eq(location)
    expect(image.image_url).to eq(url)

    expect(image.credit.author).to eq(username)
    expect(image.credit.source).to be_a(String)
  end
end