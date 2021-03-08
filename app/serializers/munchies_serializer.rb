class MunchiesSerializer
  include FastJsonapi::ObjectSerializer
  attributes :destination_city, :travel_time, :forecast, :restaurant
  set_id :id
  set_type :munchie
end