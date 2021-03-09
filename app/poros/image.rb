class Image
  attr_reader :id, :location, :image_url, :credit

  def initialize(url, username, location)
    @id = nil
    @location = location
    @image_url = url
    @credit = Credit.new(username)
  end
end