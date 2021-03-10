require 'rails_helper'

describe 'Directions Service' do
  describe '(happy path)' do
    it 'returns direction data for start to end point', :vcr do
      origin = 'denver,co'
      destination = 'pueblo,co'

      data = DirectionsService.get_data(origin, destination)

      expect(data[:route][:realTime]).to be_an(Integer)
      expect(data[:route][:locations][0][:adminArea5]).to eq("Denver")
      expect(data[:route][:locations][0][:adminArea3]).to eq("CO")
      expect(data[:route][:locations][1][:adminArea5]).to eq("Pueblo")
      expect(data[:route][:locations][1][:adminArea3]).to eq("CO")
    end
  end

  describe '(sad path)' do
    it 'Returns a 402 status code when routing is impossible', :vcr do
      origin = 'new york,ny'
      destination = 'london,uk'

      error_message = DirectionsService.get_data(origin, destination)

      expect(error_message[:info][:statuscode]).to eq(402)
      expect(error_message[:info][:messages][0]).to eq("We are unable to route with the given locations.")
    end
  end
end