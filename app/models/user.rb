class User < ActiveRecord::Base
  has_secure_password
  has_secure_token :api_key

  validates :email, presence: true, uniqueness: true

  before_save { |user| user.email.downcase! if user.email }

end
