class Api::V1::UsersController < ApplicationController
  def create
    require 'pry'; binding.pry
    #add sad path conditions later
    user = User.create(params[:email])
    require 'pry'; binding.pry
    if user
      render json: UserSerializer.new(user)
    end
  end
end