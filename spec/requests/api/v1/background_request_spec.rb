require 'rails_helper'

describe 'Background image request' do
  describe '(happy path)' do
    it 'returns an image given a location' do
      location = 'denver,co'
      get "/api/v1/backgrounds?location=#{location}"

      data = JSON.parse(response.body)
      expect(response)
    end
  end
end