class LocationCoordinates
  attr_reader :lattitude, :longitude

  def initialize(data)
    @lattitude = data[:lat]
    @longitude = data[:lng]
  end
end