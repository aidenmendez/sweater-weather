require 'rails_helper'

RSpec.describe 'Munchies request' do
  describe '(happy path)' do
    it "returns all required information" do
      start = 'denver,co'
      destination = 'pueblo,co'
      food = 'hamburger'

      request "/api/v1/munchies?start=#{start}&destination=#{destination}&food=#{food}"

      data = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(data[:id]).to be_nil
      expect(data[:type]).to eq("munchie")
      expect(data[:attributes][:destination_city]).to eq("Pueblo, CO")
      expect(data[:attributes][:travel_time]).to eq("1 hours 48 min")
      expect(data[:attributes][:forecast][:summary]).to be_a(String)
      expect(data[:attributes][:forecast][:temperature]).to be_a(Numeric)
      expect(data[:attributes][:restaurant][:name]).to be_a(String)
      expect(data[:attributes][:restaurant][:address]).to be_a(String)
    end
  end

  describe '(sad path)' do

  end
end