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
      
    end
  end

  describe '(sad path)' do

  end
end