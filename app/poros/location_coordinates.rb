class LocationCoordinates
  attr_reader :lattitude, :longitude

  def initialize(data)
    @lattitude = data[:lattitude]
    @longitude = data[:longitude]
  end
end