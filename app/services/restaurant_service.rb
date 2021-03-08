class RestaurantService
  class << self
    def conn
      Faraday.new("https://api.yelp.com/v3") do |req|
        req.authorization :Bearer, ENV['YELP_KEY']
        req.headers["Content-type"]= "application/json"
      end
    end

    def search(time, destination, food)
      response = conn.get("businesses/search") do |req|
        req.params["open_at"] = time
        req.params["location"] = destination
        req.params["term"] = food
      end

      JSON.parse(response.body, symbolize_names: true)[:businesses].first
    end
  end  
end