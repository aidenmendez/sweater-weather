class GeocodeFacade
  class << self
    def get_coordinates(location)
      coord_data = GeocodeService.get_coordinates(location)
      LocationCoordinates.new(coord_data)
    end
  end
end