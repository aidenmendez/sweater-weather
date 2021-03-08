class RestaurantFacade
  class << self  
    def get_restaurant(time, destination, term)
      restaurant_data = RestaurantService.search(time, destination, term)
      Restaurant.new(restaurant_data)
    end
  end  
end