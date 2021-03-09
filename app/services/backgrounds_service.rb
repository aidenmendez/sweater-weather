class BackgroundsService
  class << self
    def get_image(location)
      response = conn.get('photos') do |req|
        req.params['query'] = "#{location}"
        req.params['per_page'] = 1
        req.params['orientation'] = 'squarish'
      end

      JSON.parse(response.body, symbolize_names: true)
    end
    
    private
    
    def conn
      Faraday.new("https://api.unsplash.com/search") do |req|
        req.params['client_id'] = ENV['UNSPLASH_KEY']
      end
    end
  end
end