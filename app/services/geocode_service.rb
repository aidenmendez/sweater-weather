class GeocodeService
  # should be a facade before this!
  class << self
    def get_coordinates(location)
      # returns {lattitude: 444, longitude: 113212}
      require 'pry'; binding.pry
    end
  end
end