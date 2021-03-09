require 'rails_helper'

describe User do
  describe 'validations' do
    it { should validate_presence_of(:email)}
    it { should validate_uniqueness_of(:email) }
  end

  it 'lowercases email before save' do
    user = User.create!({
      :email => "WHATEVER@example.com",
      :password => "password",
      :password_confirmation => "password"
      })

    expect(user.email).to eq('whatever@example.com')
  end

end