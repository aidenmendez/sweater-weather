class DirectionsFacade
  class << self
    def get_directions(origin, destination)
      data = DirectionsService.get_data(origin, destination)

    end
  end
end