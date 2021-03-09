class User < ApplicationRecord
  has_secure_password
  has_secure_token :api_key

  validates :email, presence: true, uniqueness: true

  before_save { |user| user.email.downcase! }

  # def downcase_email
  #   self.email.downcase!
  # end

  # validates :api_key, presence: true, uniqueness: true
end
