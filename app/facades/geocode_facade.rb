class GeocodeFacade
  class << self
    def get_coordinates(location)
      data = GeocodeService.get_coordinates(location)
      LocationCoordinates.new(data)
    end
  end
end