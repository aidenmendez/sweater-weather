class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :hourly_weather, :daily_weather, :current_weather
  set_id :id
  set_type :forecast
end