require 'rails_helper'

describe 'Background image request' do
  describe '(happy path)' do
    it 'returns an image given a location', :vcr do
      location = 'denver,co'
      get "/api/v1/backgrounds?location=#{location}"

      data = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(response.status).to eq(200)
      expect(data[:id]).to be_nil
      expect(data[:type]).to eq("image")
      expect(data[:attributes][:location]).to eq(location)
      expect(data[:attributes][:image_url]).to be_a(String)
      expect(data[:attributes][:credit][:author]).to be_a(String)
      expect(data[:attributes][:credit][:source]).to eq("www.unsplash.com")      
    end
  end
end