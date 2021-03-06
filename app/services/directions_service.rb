class DirectionsService
  class << self
    def conn
      Faraday.new("http://mapquestapi.com/directions/v2") do |req|
        req.params['key'] = ENV['MAPQUEST_KEY']
      end
    end
  
    def get_data(beginning, destination)
      response = conn.get('route') do |req|
        req.params['from'] = beginning
        req.params['to'] = destination
      end
      
      JSON.parse(response.body, symbolize_names: true)   
    end
  end
end