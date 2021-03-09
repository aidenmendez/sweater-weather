class ImageSerializer
  include FastJsonapi::ObjectSerializer
  attributes :location, :image_url, :credit
  set_id :id
  set_type :image
end