class DirectionFacade
  class << self
    def conn
      Faraday.new("http://mapquestapi.com/directions/v2") do |req|
        req.params['key'] = ENV['MAPQUEST_KEY']
      end
    end

    def get_time(beginning, destination)
      response = conn.get('route') do |req|
        req.params['from'] = beginning
        req.params['to'] = destination
      end
      
      data = JSON.parse(response.body, symbolize_names: true)
    
      if data[:info][:statuscode] == 0
        data[:route][:formattedTime]
      end      
    end
  end
end