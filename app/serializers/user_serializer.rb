class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :email, :api_key
  set_type :user
  set_id :id
end