require 'rails_helper'

RSpec.describe 'Munchies request' do
  describe '(happy path)' do
    it "returns all required information", :vcr do
      start = 'denver,co'
      destination = 'pueblo,co'
      food = 'hamburger'

      get "/api/v1/munchies?start=#{start}&destination=#{destination}&food=#{food}"

      data = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(data[:id]).to be_nil
      expect(data[:type]).to be_a(String)
      expect(data[:attributes][:destination_city]).to be_a(String)
      expect(data[:attributes][:travel_time]).to be_a(String)
      expect(data[:attributes][:forecast][:summary]).to be_a(String)
      expect(data[:attributes][:forecast][:temperature]).to be_a(Float)
      expect(data[:attributes][:restaurant][:name]).to be_a(String)
      expect(data[:attributes][:restaurant][:address]).to be_a(String)
    end
  end

  describe '(sad path)' do

  end
end