class RestaurantFacade
  class << self
  #   def conn
  #     Faraday.get("https://api.yelp.com/v3") do |req|
  #           req.headers["Authorization"]= "Bearer #{ENV[YELP_API_KEY]}",
  #           req.headers["Content-type"]= "application/json"
  #     end
  #   end

  #   def search(time, destination, food)
  #     conn.get("businesses/search") do |req|
  #       req.params["open_at"] = time
  #       req.params["location"] = destination
  #       req.params["term"] = food
  #     end.limit(1)
  #   end
  
    def get_restaurant(time, destination, term)
      restaurant_data = RestaurantService.search(time, destination, term)
      Restaurant.new(restaurant_data)
    end
  end  
end