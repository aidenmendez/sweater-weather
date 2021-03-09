class Api::V1::UsersController < ApplicationController
  def create
    #add sad path conditions later
    begin
      params[:user] = {
                        :email                  => params[:email], 
                        :password               =>  params[:password],
                        :confirmation_password  => params[:confirmation_password]
                      }
  
      user = User.create!(user_params)
      render json: UserSerializer.new(user), status: 201
    rescue
      require 'pry'; binding.pry
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end