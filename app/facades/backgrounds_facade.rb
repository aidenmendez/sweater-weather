class BackgroundsFacade
  class << self
    def get_image(location)
      image_data = BackgroundsService.get_image(location)
      
      Image.new(image_data[:results][0][:urls][:raw], image_data[:results][0][:user][:username], location)
    end
  end
end