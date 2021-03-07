class GeocodeService
  # should be a facade before this!
  class << self
    def conn
      Faraday.new("http://mapquestapi.com/geocoding/v1") do |req|
        req.params['key'] = ENV['MAPQUEST_KEY']
      end
    end

    def get_coordinates(location)
      response = conn.get('address') do |req|
        req.params['location'] = location
      end

      data = JSON.parse(response.body, symbolize_names: true)

      if data[:info][:statuscode] == 0
        data[:results][0][:locations][0][:latLng]
      end      
    end
  end
end